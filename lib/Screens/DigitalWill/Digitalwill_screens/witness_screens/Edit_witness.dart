import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Models/Digital_will/witness_get_res.dart';
import 'get_witness_list.dart';


class WitnessEditScreen extends StatefulWidget {
  final Witness witness;

  const WitnessEditScreen({super.key, required this.witness});

  @override
  _WitnessEditScreenState createState() => _WitnessEditScreenState();
}

class _WitnessEditScreenState extends State<WitnessEditScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _mobileController;
  late TextEditingController _ageController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.witness.firstName);
    _lastNameController = TextEditingController(text: widget.witness.lastName);
    _mobileController = TextEditingController(text: widget.witness.mobile);
    _addressController = TextEditingController(text: widget.witness.address);
  }


  void _updateWitnessDetails() async {
    Map<String, dynamic> updateData = {
      'witnessId': widget.witness.id,
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'mobile': _mobileController.text,
      'address': _addressController.text,
    };

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.get("token");

      Response response =
      await Dio().put('http://43.205.12.154:8080/v2/will/witness',
          data: updateData,
          options: Options(
            headers: {'Authorization': token},
          ));

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Witness details updated successfully.'),
        ));
        Navigator.pop(context);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>  DigitalWillGetWitness(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to update witness details.'),
        ));
      }
    } catch (e) {
      print('Error updating witness details: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Failed to update witness details. Please try again.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
        const Text('Edit witness', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField(
              controller: _firstNameController,
              labelText: 'First name',
              mandatory: true,
            ),
            buildTextField(
              controller: _lastNameController,
              labelText: 'Last name',
              mandatory: true,
            ),
            buildTextField(
              controller: _ageController,
              labelText: 'Age',
              mandatory: false,
              isNumeric: true
            ),
            buildTextField(
              controller: _mobileController,
              labelText: 'Mobile',
              mandatory: true,
              isNumeric: true
            ),
            buildTextField(
              controller: _emailController,
              labelText: 'Email id',
              mandatory: false,
            ),
            buildTextField(
              controller: _addressController,
              labelText: 'Address',
              mandatory: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _updateWitnessDetails,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                const Color(0xff429bb8), // Set the background color
              ),
              child:
              const Text('Update', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
    bool isNumeric = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (mandatory)
              const Text(
                ' *',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          inputFormatters: isNumeric
              ? [
            FilteringTextInputFormatter.digitsOnly,
            NoLeadingSpaceFormatter(),
          ]
              : [NoLeadingSpaceFormatter()],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
            EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          keyboardType:
          isNumeric ? TextInputType.number : TextInputType.text,
        ),
      ],
    );
  }
}

class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}