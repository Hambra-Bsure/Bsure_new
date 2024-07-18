
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Will_payments.dart';

class WillBillingScreen extends StatefulWidget {
  final int planId;
  final int price;

  const WillBillingScreen({Key? key, required this.planId, required this.price}) : super(key: key);

  @override
  _WillBillingScreenState createState() => _WillBillingScreenState();
}

class _WillBillingScreenState extends State<WillBillingScreen> {
  final TextEditingController _couponController = TextEditingController();
  int? _finalPrice;
  int? _discountAmount;
  int? _gstAmount;
  String? _couponError;
  String? _couponSuccess;
  double _discountPercentage = 40.0; // Fixed discount percentage
  bool _isTemporaryGst = true; // Flag to control the temporary GST display

  @override
  void initState() {
    super.initState();
    _finalPrice = widget.price;
    _calculateGST();
  }

  Future<void> _applyCoupon() async {
    final couponCode = _couponController.text.trim();
    if (couponCode.isEmpty) {
      setState(() {
        _couponError = 'Please enter a coupon code';
        _couponSuccess = null;
      });
      return;
    }

    // Simulate API response for fixed 40% discount
    await Future.delayed(Duration(seconds: 1));
    if (couponCode == "VALID40") {
      _discountAmount = (widget.price * _discountPercentage / 100).round();
      _finalPrice = widget.price - _discountAmount!;
      _isTemporaryGst = false; // Update the flag to show the actual GST amount
      _calculateGST();
      setState(() {
        _couponError = null;
        _couponSuccess = 'Coupon applied successfully! Discount: ₹${(_discountAmount! / 100).toStringAsFixed(2)}';
      });
    } else {
      setState(() {
        _couponError = 'Invalid coupon code';
        _couponSuccess = null;
      });
    }
  }

  void _calculateGST() {
    // Calculate GST based on the final price after discount
    if (_isTemporaryGst) {
      _gstAmount = 0;
    } else {
      _gstAmount = (_finalPrice! * 0.18).round();
      _finalPrice = _finalPrice! + _gstAmount!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedInitialPrice = (widget.price / 100).toStringAsFixed(2);
    final formattedFinalPrice = (_finalPrice! / 100).toStringAsFixed(2);
    final formattedDiscountAmount = (_discountAmount != null ? (_discountAmount! / 100).toStringAsFixed(2) : "0.00");
    final formattedGSTAmount = (_gstAmount != null ? (_gstAmount! / 100).toStringAsFixed(2) : "0.00");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bsure', style: TextStyle(color: Colors.white, fontSize: 25)),
        backgroundColor: const Color(0xff429bb8),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle("Plan Selected:"),
            _buildPlanDetails(formattedInitialPrice),
            const SizedBox(height: 20),
            _buildSectionTitle("Apply Coupon:"),
            _buildCouponCodeInput(),
            const SizedBox(height: 10),
            if (_couponSuccess != null)
              Text(
                _couponSuccess!,
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            if (_couponError != null)
              Text(
                _couponError!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            const SizedBox(height: 20),
            _buildSectionTitle("Price Details:"),
            _buildBillingDetails(formattedInitialPrice, formattedDiscountAmount, formattedGSTAmount),
            const Divider(color: Color(0xff429bb8)),
            _buildTotalAmount(formattedFinalPrice),
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
        ),
      ),
    );
  }

  Widget _buildPlanDetails(String priceWithText) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Plan Details:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "₹$priceWithText",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCouponCodeInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: _couponController,
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
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 4,
              child: ElevatedButton(
                onPressed: _applyCoupon,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingDetails(String priceWithText, String discountAmount, String gstAmount) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBillingRow("Cost of the Plan:", priceWithText),
            if (_couponSuccess != null)
              _buildBillingRow("Coupon Discount:", discountAmount),
            _buildBillingRow("GST (18%):", gstAmount),
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
          ),
          const Spacer(),
          Text(
            "₹$value",
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount(String priceWithText) {
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
              ),
            ),
            Text(
              "₹$priceWithText",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProceedToPayButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WillPaymentsScreen(planId: widget.planId, price: _finalPrice!),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff429bb8),
      ),
      child: const Text(
        'Proceed to Payment',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
