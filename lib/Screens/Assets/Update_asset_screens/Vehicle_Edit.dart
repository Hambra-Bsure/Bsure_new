import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/Vehicle.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/vehicle_screen.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit Vehicle',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField<String>(
                value: vehicleType,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Type', // Set the label text
                ),
                items: <String>['Bike', 'Car'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      vehicleType = value;
                    });
                  }
                },
              ),
              TextFormField(
                initialValue: brandName,
                decoration: const InputDecoration(labelText: 'Brand Name'),
                onChanged: (value) {
                  setState(() {
                    brandName = value;
                  });
                },
              ),
              TextFormField(
                initialValue: modelName,
                decoration: const InputDecoration(labelText: 'Model Name'),
                onChanged: (value) {
                  setState(() {
                    modelName = value;
                  });
                },
              ),
              TextFormField(
                initialValue: registrationNumber,
                decoration:
                const InputDecoration(labelText: ' Registration Number'),
                onChanged: (value) {
                  setState(() {
                    registrationNumber = value;
                  });
                },
              ),
              TextFormField(
                initialValue: chassisNumber,
                decoration:
                const InputDecoration(labelText: 'Chassis Number'),
                onChanged: (value) {
                  setState(() {
                    chassisNumber = value;
                  });
                },
              ),
              TextFormField(
                initialValue: comments,
                decoration: const InputDecoration(labelText: 'Comments'),
                onChanged: (value) {
                  setState(() {
                    comments = value;
                  });
                },
              ),
              TextFormField(
                initialValue: attachment,
                decoration: const InputDecoration(labelText: 'Attachment'),
                onChanged: (value) {
                  setState(() {
                    attachment = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  // Update the RealEstate object with the new values
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

                  // Call API to update real estate details
                  final response = await updateVehicle(updatedVehicle);
                  print(response);
                  DisplayUtils.showToast('Asset Updated Successfully');

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
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Vehicle?> updateVehicle(Vehicle realEstate) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null) {
      // Handle token absence or expiration here
      return null;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token; // Add token to headers

    try {
      final response = await dio.put(
        'http://43.205.12.154:8080/v2/asset/${realEstate.assetId}',
        data: realEstate
            .toJson(), // Convert real estate object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        // Parse and return updated real estate details
        return Vehicle.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      print(e);
      return null; // Return null if an error occurs
    }
  }
}
