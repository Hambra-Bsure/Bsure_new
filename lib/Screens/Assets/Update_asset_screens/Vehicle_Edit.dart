import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/Vehicle.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/vehicle_screen.dart';

enum VehicleType { Car, Bike }

class VehicleEdit extends StatefulWidget {
  final Vehicle vehicle;
  final String assetType;

  const VehicleEdit(
      {super.key, required this.vehicle, required this.assetType});

  @override
  State<VehicleEdit> createState() => _VehicleEditState();
}

class _VehicleEditState extends State<VehicleEdit> {
  late String vehicleType;
  late String brandName;
  late String modelName;
  late String registrationNumber;
  late String chassisNumber;
  late String comments;
  late String attachment;

  VehicleType? _selectedVehicleType;
  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    vehicleType = widget.vehicle.vehicleType ?? '';
    brandName = widget.vehicle.brandName ?? '';
    modelName = widget.vehicle.modelName ?? '';
    registrationNumber = widget.vehicle.registrationNumber ?? '';
    chassisNumber = widget.vehicle.chassisNumber ?? '';
    comments = widget.vehicle.comments ?? '';
    attachment = widget.vehicle.attachment ?? '';

    // Initialize _selectedVehicleType based on vehicleType
    if (vehicleType.isNotEmpty) {
      _selectedVehicleType = VehicleType.values.firstWhere(
        (type) =>
            type.toString().split('.').last.toLowerCase() ==
            vehicleType.toLowerCase(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title:
            const Text('Edit vehicle', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildDropdownField(
                value: _selectedVehicleType,
                onChanged: (value) {
                  setState(() {
                    _selectedVehicleType = value as VehicleType?;
                    vehicleType =
                        _selectedVehicleType?.toString().split('.').last ?? '';
                  });
                },
                items: VehicleType.values.map((type) {
                  return DropdownMenuItem<VehicleType>(
                    value: type,
                    child: Text(type.toString().split('.').last),
                  );
                }).toList(),
                labelText: 'Select vehicle type',
                mandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Brand name',
                initialValue: brandName,
                onChanged: (value) => setState(() => brandName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Model name',
                initialValue: modelName,
                onChanged: (value) => setState(() => modelName = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                  labelText: 'Registration number',
                  initialValue: registrationNumber,
                  onChanged: (value) =>
                      setState(() => registrationNumber = value),
                  isMandatory: true,
                  isNumeric: true),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Chassis number',
                initialValue: chassisNumber,
                onChanged: (value) => setState(() => chassisNumber = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_selectedVehicleType == null) {
                    DisplayUtils.showToast('Please select Vehicle type');
                    return;
                  }

                  if (brandName.isEmpty) {
                    DisplayUtils.showToast('Please enter Brand name');
                    return;
                  }

                  if (registrationNumber.isEmpty) {
                    DisplayUtils.showToast('Please enter Registration number');
                    return;
                  }

                  final updatedVehicle = Vehicle(
                    vehicleType: vehicleType,
                    brandName: brandName,
                    modelName: modelName,
                    registrationNumber: registrationNumber,
                    chassisNumber: chassisNumber,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.vehicle.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update vehicle details
                  final response = await updateVehicle(updatedVehicle);

                  DisplayUtils.showToast(
                      'Vehicle Asset  details updated successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => VehicleScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                    const Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
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
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required String labelText,
    required String initialValue,
    required Function(String) onChanged,
    bool isMandatory = false,
    bool isNumeric = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        label: isMandatory
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: labelText,
                      style: const TextStyle(color: Colors.black),
                    ),
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            : Text(labelText, style: const TextStyle(color: Colors.black)),
        border: const OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Trim leading and trailing spaces
        final trimmedValue = value.trim();
        onChanged(trimmedValue);
      },
      validator: (value) {
        if (isMandatory && value!.isEmpty) {
          return 'Please enter $labelText.';
        }
        return null;
      },
      inputFormatters: isNumeric
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              NoLeadingSpaceFormatter(),
            ]
          : <TextInputFormatter>[
              NoLeadingSpaceFormatter(),
            ],
    );
  }

  Widget buildAttachmentField() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _attachmentController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff429bb8)),
                  ),
                  hintText: "Attachemnt you want to upload(optional)",
                  hintStyle: TextStyle(fontSize: 16),
                ),
                readOnly: true,
                onTap: uploadFile,
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: uploadFile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff429bb8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                ),
              ),
              child: const Text(
                'Choose file',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = result.files.single;
        _attachmentController.text = proof.name;
      });
    } else {
      // Handle error when no file is selected.
    }
  }

  Future<Vehicle?> updateVehicle(Vehicle vehicle) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${vehicle.assetId}',
        data: vehicle
            .toJson(), // Convert vehicle object to JSON and send as request body
      );

      await _submitImage();

      if (response.statusCode == 200) {
        return Vehicle.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }

  Future<void> _submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (proof == null || token == null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Invalid Token'),
            content: const Text('Please log in again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(proof.path),
    });

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      await dio.post(
        "https://dev.bsure.live/v2/asset/${widget.vehicle.assetId}/upload",
        data: formData,
      );
    } catch (e) {
      DisplayUtils.showToast('Failed to upload file');
    }
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
