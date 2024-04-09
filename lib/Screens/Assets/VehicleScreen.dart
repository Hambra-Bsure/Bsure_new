import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Repositary/Models/AssetModels/VehicleRequest.dart';
import '../Repositary/Retrofit/node_api_client.dart';

class VehicleScreen extends StatefulWidget {
  final String assetType;

  const VehicleScreen({Key? key, required this.assetType}) : super(key: key);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

enum VehicleType { Car, Bike }

class _VehicleScreenState extends State<VehicleScreen> {
  final TextEditingController _assetTypeController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _chassisNumberController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  VehicleType? _selectedVehicleType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Vehicle', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdownField(
              value: _selectedVehicleType,
              onChanged: (value) {
                setState(() {
                  _selectedVehicleType = value as VehicleType?;
                });
              },
              items: VehicleType.values.map((type) {
                return DropdownMenuItem<VehicleType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              labelText: 'Vehicle Type',
              mandatory: true,
            ),
            buildTextField(
              controller: _brandNameController,
              labelText: 'Brand Name',
              mandatory: true,
            ),
            buildTextField(
              controller: _modelNameController,
              labelText: 'Model Name (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _registrationNumberController,
              labelText: 'Registration Number',
              mandatory: true,
            ),
            buildTextField(
              controller: _chassisNumberController,
              labelText: 'Chassis Number (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments (Optional)',
              mandatory: false,
            ),
            buildTextField(
              controller: _attachmentController,
              labelText: 'Attachment (Optional)',
              mandatory: false,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button press
                  _submitForm();
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField({
    required VehicleType? value,
    required ValueChanged<dynamic> onChanged,
    required List<DropdownMenuItem<VehicleType>> items,
    required String labelText,
    bool mandatory = false,
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
        DropdownButtonFormField<VehicleType>(
          value: value,
          onChanged: onChanged,
          items: items,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  void _submitForm() async {
    const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.'
        'eyJ1c2VySWQiOjIsInVzZXJFbWFpbCI6bnVsbCwidXNlck1vYmlsZSI6IjgzM'
        'jg1NjQ2ODMiLCJpYXQiOjE3MTIzMTkyMTUsImV4cCI6MTcxMjkyNDAxNX0.'
        'bh3HdNwm5-SYVIRwkqVl5z3giOUY9kTGSk7pV7aedwc'; // Replace with your actual token

    final dio = Dio();
    final client = NodeClient(dio);

    final request = VehicleRequest(
      assetType: widget.assetType,
      vehicleType: _selectedVehicleType.toString().split('.').last,
      brandName: _brandNameController.text,
      modelName: _modelNameController.text,
      registrationNumber: _registrationNumberController.text,
      chassisNumber: _chassisNumberController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateVehicle(token, request);
      print(response);
      // Handle the response data as needed
    } catch (e) {
      print('Failed to submit data: $e');
      // Handle errors
    }
  }

}

