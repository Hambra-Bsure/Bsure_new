import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Repositary/Models/Digital_will/digitalwill_get_res.dart';
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
  late TextEditingController _addressController;

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
      var token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJNb2JpbGUiOiI4MzI4NTY0NjgzIiwiaWF0IjoxNzE2NjM1NzI4LCJleHAiOjE3MTcyNDA1Mjh9.qvdxr2kZ1T8793C-4l48UlAbq_mrD6x5ovMXafFIXAs";

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
        const Text('Edit Witness', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _mobileController,
              decoration: const InputDecoration(labelText: 'Mobile'),
            ),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(labelText: 'Address'),
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
}
