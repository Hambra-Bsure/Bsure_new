import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CouponScreen(),
    );
  }
}

class CouponScreen extends StatefulWidget {
  @override
  _CouponScreenState createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  final _couponController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _resultMessage;

  Future<void> _submitCoupon() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _resultMessage = null;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token') ?? '';

      final dio = Dio();
      final response = await dio.post(
        'https://example.com/api/apply-coupon',
        data: {'coupon': _couponController.text.trim()},
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        setState(() {
          _resultMessage = 'Coupon applied successfully!';
        });
      } else {
        setState(() {
          _resultMessage = 'Failed to apply coupon.';
        });
      }
    } on DioError catch (e) {
      setState(() {
        _resultMessage = e.response?.data['message'] ?? 'Something went wrong!';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Coupon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _couponController,
                decoration: InputDecoration(
                  labelText: 'Coupon Code',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a coupon code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: _submitCoupon,
                child: Text('Apply Coupon'),
              ),
              if (_resultMessage != null) ...[
                SizedBox(height: 20),
                Text(
                  _resultMessage!,
                  style: TextStyle(
                    color: _resultMessage == 'Coupon applied successfully!'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
