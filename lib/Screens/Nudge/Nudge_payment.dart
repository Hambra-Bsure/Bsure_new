// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, non_constant_identifier_names, file_names

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Repositary/Models/Nudge/Coupon/Coupon_response.dart';
import '../Repositary/Models/Nudge/Coupon/Nudge_coupon_request.dart';
import '../Repositary/Models/Nudge/Get_plan_res.dart';
import '../Repositary/Retrofit/node_api_client.dart';
import '../Utils/DisplayUtils.dart';
import '../Utils/SharedPrefHelper.dart';

class PlanSelectedDetails extends StatefulWidget {
  final String selectedValue;
  final Plans selectedPlan; // New parameter

  const PlanSelectedDetails(
      {Key? key, required this.selectedValue, required this.selectedPlan})
      : super(key: key);

  @override
  _PlanSelectedDetailsState createState() => _PlanSelectedDetailsState();
}

class _PlanSelectedDetailsState extends State<PlanSelectedDetails> {
  final TextEditingController _couponCodeController = TextEditingController();

  double totalAmount = 0;
  double discountAmount = 0;
  double gstAmount = 0;
  double planAmountAfterDiscount = 0;

  late String couponCode;
  String? customerPhone;
  String? customerId;

  // var cfPaymentGatewayService = CFPaymentGatewayService();

  String? mobileNumber;

  final Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    super.initState();

    _loadUserId();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    totalAmount = double.parse(widget.selectedValue);
    planAmountAfterDiscount = calculatePlanAmountAfterDiscount(
        totalAmount, discountAmount, gstAmount);
    getMobileNumber().then((value) {
      setState(() {
        mobileNumber = value;
      });
    });
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentSuccessScreen(response.paymentId!),
      ),
    );
    print("Payment Success: ${response.paymentId}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentFailureScreen(
          response.code!,
          response.message!,
          onRetry: () => startRazorpayPayment(),
        ),
      ),
    );
    print("Payment Error: ${response.code!.toString()} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    if (response.walletName != null) {
      print("External Wallet: ${response.walletName}");
      // Now you can use response.walletName safely
    } else {
      // Handle the case where walletName is null
      print("External Wallet: Unknown Wallet");
    }
  }

  Future<String> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    String userId =
        sharedPreferences.getString(SharedPrefHelper().USER_ID) ?? '';
    return userId;
  }

  Future<String?> getMobileNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefHelper().USER_NUMBER);
  }

  double calculatePlanAmountAfterDiscount(
      double totalAmount, double discountAmount, double gstAmount) {
    return totalAmount - discountAmount + gstAmount;
  }

  @override
  Widget build(BuildContext context) {
    String title =
        widget.selectedPlan.label ?? "Plan ${widget.selectedPlan.id}";

    int priceInPaisa = widget.selectedPlan.price ?? 0;
    double priceInRupees = priceInPaisa / 100.0;
    String priceWithText = title == "Annual Plan"
        ? "$priceInRupees"
        : (title == "Lifetime Plan" ? "$priceInRupees" : "$priceInRupees");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text("Bsure",
            style: TextStyle(fontSize: 25, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle("Plan Selected:"),
            _buildPlanDetails(title, priceWithText),
            _buildSectionTitle("Apply Coupon:"),
            _buildCouponCodeInput(priceWithText),
            _buildSectionTitle("Price Details:"),
            _buildBillingDetails(priceWithText),
            const SizedBox(height: 10),
            const Divider(color: Color(0xff429bb8)),
            _buildTotalAmount(priceWithText),
            const SizedBox(height: 16),
            _buildProceedToPayButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey[300],
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xff429bb8),
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget _buildPlanDetails(String title, String priceWithText) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Plan Details:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "$title $priceWithText /-", // Updated label name
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              "Cost: $priceWithText", // Updated price
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCodeInput(String pricewithText) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: _couponCodeController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff429bb8)),
                  ),
                  prefixIcon: Icon(
                    Icons.discount_rounded,
                    color: Color(0xff429bb8),
                  ),
                  hintText: "Enter Coupon Code",
                ),
                onChanged: (value) {
                  setState(() {
                    couponCode = value;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                flex: 4,
                child: ElevatedButton(
                  onPressed: () {
                    _applyCouponCode(pricewithText);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                        0xff429bb8), // Set the desired background color here
                  ),
                  child: const Text('APPLY',
                      style: TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                      )),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingDetails(String priceWithText) {
    final billingDetails = BillingDetails(
      planCost: priceWithText,
      couponDiscount: discountAmount.toStringAsFixed(2),
      // Use toStringAsFixed to show decimal values
      gstAmount: gstAmount.toStringAsFixed(2),
      // Use toStringAsFixed to show decimal values
      totalAmount: (planAmountAfterDiscount + gstAmount)
          .toStringAsFixed(2), // Use toStringAsFixed to show decimal values
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBillingRow("Cost of the Plan:", billingDetails.planCost),
            _buildBillingRow("Coupon Discount:", billingDetails.couponDiscount),
            _buildBillingRow("Apply GST(18%):", billingDetails.gstAmount),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(String priceWithText) {
    final billingDetails = BillingDetails(
        planCost: priceWithText,
        couponDiscount: discountAmount.toString(),
        gstAmount: gstAmount.toString(),
        //totalAmount: calculatePlanAmountAfterDiscount(totalAmount, discountAmount, gstAmount).toString(),
        totalAmount: priceWithText);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total Amount:",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff429bb8),
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              billingDetails.totalAmount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProceedToPayButton() {
    return ElevatedButton(
      onPressed: () async {
        await startRazorpayPayment();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff429bb8),
      ),
      child: const Text('PROCEED TO PAY',
          style: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }

  void _applyCouponCode(String pricewithText) {
    if (_couponCodeController.text.isNotEmpty) {
      couponapiCall(pricewithText);
    } else {
      DisplayUtils.showToast("Please enter a coupon code");
    }
  }

  void couponapiCall(String pricewithText) async {
    final data = UserDiscountRequest();
    final prefs = await SharedPreferences.getInstance();
    String userId = await _loadUserId();

    data.userId = int.parse(userId);
    data.code = _couponCodeController.text;
    data.planAmount = int.parse(pricewithText);

    var token = prefs.get("token");
    Dio dio = Dio();
    dio.options.headers['Authorization'] = token;
    final client = NodeClient(dio);

    try {
      final response = await client.userdiscount(data);
      print(response);
      print(jsonEncode(response));
      processResponse(response as UserdiscountResponsebean, pricewithText);
    } catch (e) {
      DisplayUtils.showToast("API failure");
    }
  }

  void processResponse(
      UserdiscountResponsebean data, String pricewithText) async {
    if (data.isvalid == true) {
      planAmountAfterDiscount = data.finalPrce?.toDouble() ?? 0.0;
      discountAmount = data.discountAmount?.toDouble() ?? 0.0;
      DisplayUtils.showToast("Coupon applied successfully");
    } else {
      planAmountAfterDiscount = totalAmount;
      discountAmount = 0;
      DisplayUtils.showToast(data.message ?? "API failure");
    }
    setState(() {
      _updateBillingDetails(pricewithText);
    });
  }

  void _updateBillingDetails(String pricewithText) {
    setState(() {
      // Recalculate billing details after updating discountAmount
      planAmountAfterDiscount = calculatePlanAmountAfterDiscount(
          totalAmount, discountAmount, gstAmount);
      // Update the UI
      _buildBillingDetails(pricewithText);
    });
  }

  void initiatePayment() {
    // apiCallForPayment();
  }

  Future<void> startRazorpayPayment() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token") ?? "";

    const apiUrl = 'https://dev.bsure.live/node/api/payment/create-order';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'planId': widget.selectedPlan.id,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        if (jsonResponse['success'] == true) {
          final orderOptions = jsonResponse['options'];

          final options = {
            'key': orderOptions['key'],
            'amount': (planAmountAfterDiscount * 100).toInt(),
            'name': orderOptions['name'],
            'description': 'Payment',
            'order_id': orderOptions['order_id'],
            'prefill': {
              'contact': orderOptions['prefill']['contact'],
              'email': orderOptions['prefill']['email'],
            },
            'external': {
              'wallets': ['paytm']
            },
          };

          // Open Razorpay payment screen with the constructed options
          _razorpay.open(options);
        } else {
          print('Failed to create Razorpay order: ${jsonResponse['error']}');
        }
      } else {
        print(
            'Failed to create Razorpay order. HTTP Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating Razorpay order: $e');
    }
  }
}

class PaymentSuccessScreen extends StatelessWidget {
  final String paymentId;

  const PaymentSuccessScreen(this.paymentId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Successful!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Payment ID: $paymentId'),
          ],
        ),
      ),
    );
  }
}

class PaymentFailureScreen extends StatelessWidget {
  final int errorCode;
  final String errorMessage;

  const PaymentFailureScreen(this.errorCode, this.errorMessage,
      {Key? key, required Future<void> Function() onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Failure'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Payment Failed!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Error Code: $errorCode'),
            const SizedBox(height: 5),
            Text('Error Message: $errorMessage'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('Retry Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentRetryScreen extends StatelessWidget {
  const PaymentRetryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retry Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Retry Payment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                //await startRazorpayPayment();
              },
              child: const Text('Retry Payment'),
            ),
          ],
        ),
      ),
    );
  }
}

class BillingDetails {
  final String planCost;
  final String couponDiscount;
  final String gstAmount;
  final String totalAmount;

  BillingDetails({
    required this.planCost,
    required this.couponDiscount,
    required this.gstAmount,
    required this.totalAmount,
  });
}
