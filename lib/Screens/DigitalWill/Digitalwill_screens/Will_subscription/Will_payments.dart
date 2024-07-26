import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show File, Platform;
import 'Will_plans.dart';

class WillPaymentsScreen extends StatefulWidget {
  final int planId;
  final int finalPrice;

  const WillPaymentsScreen(
      {required this.planId, Key? key, required this.finalPrice})
      : super(key: key);

  @override
  _WillPaymentsScreenState createState() => _WillPaymentsScreenState();
}

class _WillPaymentsScreenState extends State<WillPaymentsScreen> {
  late Razorpay _razorpay;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    double priceInRupees = widget.finalPrice / 100.0; // Convert price to rupees
    String formattedPrice = NumberFormat.currency(locale: 'en_IN', symbol: '₹')
        .format(priceInRupees); // Format price with currency symbol

    print('Formatted Price: $formattedPrice');

    print("subba reddy");
    print('Plan ID: ${widget.planId}');
    print('Price: ${widget.finalPrice}');

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    _createOrder();
  }

  Future<void> _createOrder() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      final response = await http.post(
        Uri.parse('https://dev.bsure.live/v2/subscription/create-order'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token.toString(),
        },
        body: jsonEncode({
          'planId': widget.planId,
          'amount': (widget.finalPrice * 100).toInt(), // Convert price to paise
        }),
      );

      if (response.statusCode == 200) {
        final orderData = jsonDecode(response.body);
        final orderOptions = orderData['options'];

        final amountInPaise = (widget.finalPrice * 100).toInt();
        // final amountInRupees = amountInPaise / 100.0; // Convert paise to rupees

        // Format amount with currency symbol
        // String formattedAmount = NumberFormat.currency(locale: 'en_IN', symbol: '₹')
        //     .format(amountInRupees);
        //
        // print('Formatted Amount: $formattedAmount'); // Print the formatted amount

        double priceInRupees = widget.finalPrice / 100.0;
        String formattedPrice = NumberFormat.currency(locale: 'en_IN', symbol: '₹')
            .format(priceInRupees);

        print('Formatted Price: $formattedPrice');

        final options = {
          'key': orderOptions['key'],
          'amount': formattedPrice, // Amount in paise as a string
          'name': orderOptions['name'],
          'description': 'Payment',
          'order_id': orderOptions['order_id'],
          'prefill': {
            'contact': orderOptions['prefill']['contact'],
            'email': orderOptions['prefill']['email'],
          },
          'external': {
            'wallets': ['paytm']
          }, // Use the formatted price for display
        };

        print('Options: $options');

        if (Platform.isAndroid || Platform.isIOS) {
          _razorpay.open(options);
        } else {
          throw UnsupportedError(
              'Razorpay is only supported on Android and iOS');
        }
      } else {
        print('Failed to create order');
      }
    } catch (e) {
      print('Error creating order: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Payment success: ${response.paymentId}');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(
          transactionId: response.paymentId!,
          amount: widget.finalPrice / 100.0,
        ),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment error: ${response.code} - ${response.message}');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentFailureScreen(
          transactionId: response.message!,
        ),
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External wallet: ${response.walletName}');
    // Show external wallet message
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text('Will Payment', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : const Text('Processing payment...'),
      ),
    );
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  final String transactionId;
  final double amount;

  const PaymentSuccessScreen(
      {required this.transactionId, required this.amount});

  Future<void> _downloadPdf(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    try {
      final response = await http.get(
        Uri.parse('https://dev.bsure.live/v2/will/pdf'),
        headers: {
          'Authorization': token.toString(),
        },
      );

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/downloaded_pdf.pdf';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded to: $filePath')),
        );

        Share.shareFiles([filePath], text: 'Check out this PDF!');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to download PDF. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Success',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 20),
            const Text('Payment Successful!', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text('Transaction ID: $transactionId',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('Amount: ₹$amount', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _downloadPdf(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8)),
              child: const Text('Download PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentFailureScreen extends StatelessWidget {
  final String transactionId;

  const PaymentFailureScreen({required this.transactionId});

  void _retryPayment(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WillPlansScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Failure',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 100),
              const SizedBox(height: 20),
              const Text('Payment Failed. Please try again.',
                  style: TextStyle(fontSize: 24, color: Colors.red)),
              const SizedBox(height: 20),
              Text('Transaction ID: $transactionId',
                  style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _retryPayment(context),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8)),
                child: const Text(
                  'Retry Payment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
