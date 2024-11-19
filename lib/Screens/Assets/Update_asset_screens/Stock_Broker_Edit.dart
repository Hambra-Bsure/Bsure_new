import 'dart:convert';
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/stock_broker_screen.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/stock_broker.dart';
import '../../Utils/DisplayUtils.dart';
import '../Static_names_list/StockBrokers.dart';

class StockBrokerEdit extends StatefulWidget {
  final StockBroker broker;
  final String assetType;

  const StockBrokerEdit(
      {Key? key, required this.broker, required this.assetType})
      : super(key: key);

  @override
  State<StockBrokerEdit> createState() => _StockBrokerEditState();
}

class _StockBrokerEditState extends State<StockBrokerEdit> {
  late String brokerName;
  late String dematAccountNumber;
  late String comments;
  late String attachment;

  String? _selectedStockBroker;
  List<Broker> _stockbroker = [];

  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchStockBrokerNames();

    brokerName = widget.broker.brokerName;
    dematAccountNumber = widget.broker.dematAccountNumber;
    comments = widget.broker.comments ?? "";
    attachment = widget.broker.attachment ?? "";
  }

  Future<void> _fetchStockBrokerNames() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/stockBrokers';

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
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Print the raw response body for debugging
        print('Response body: ${response.body}');

        // Decode the response
        final List<dynamic> data = json.decode(response.body);

        // Ensure the data is a list
        if (data is List) {
          setState(() {
            _stockbroker = data.map((item) {
              if (item is Map<String, dynamic>) {
                // If it's a map, create a Broker instance from JSON
                return Broker.fromJson(item);
              } else if (item is String) {
                // If it's a string, directly use the string as the name
                return Broker(name: item);
              } else {
                throw Exception('Unexpected data type: $item');
              }
            }).toList();

            _selectedStockBroker = _stockbroker
                .firstWhere((bank) => bank.name == widget.broker.brokerName)
                .name;
          });

          // Print fetched broker names for debugging
          print(
              'Fetched broker names: ${_stockbroker.map((broker) => broker.name).toList()}');
        } else {
          print('Unexpected response format: ${response.body}');
        }
      } else {
        print(
            'Failed to load broker names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching broker names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit stock broker',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildStockBrokerDropdown(),
            const SizedBox(height: 16.0),
            buildTextField(
                labelText: 'Demat account number',
                initialValue: dematAccountNumber,
                onChanged: (value) =>
                    setState(() => dematAccountNumber = value),
                isMandatory: true,
                isNumeric: true),
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
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (brokerName.isEmpty) {
                    DisplayUtils.showToast('Please enter Broker name.');
                    return;
                  }
                  if (dematAccountNumber.isEmpty) {
                    DisplayUtils.showToast(
                        'Please enter demat account number.');
                    return;
                  }

                  final updatedBroker = StockBroker(
                    brokerName: _selectedStockBroker ?? '',
                    dematAccountNumber: dematAccountNumber,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.broker.assetId,
                    category: widget.assetType,
                  );

                  final response = await updateStockBroker(updatedBroker);
                  DisplayUtils.showToast('Asset updated successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => StockBrokerScreen(
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStockBrokerDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'StockBroker name',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' *',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: _selectedStockBroker ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedStockBroker = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select StockBroker Name'),
            ),
            ..._stockbroker.map((stockbroker) {
              return DropdownMenuItem<String>(
                value: stockbroker.name,
                child: Text(stockbroker.name),
              );
            }).toList(),
          ],
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
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

  Future<void> updateStockBroker(StockBroker broker) async {
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
      return;
    }

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${broker.assetId}',
        data: broker.toJson(),
      );

      await _submitImage();

      if (response.statusCode == 200) {
        // DisplayUtils.showToast("StockBroker Details Updated Successfully");
      } else {
        // Handle update failure
      }
    } catch (e) {
      // Handle error
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
        "https://dev.bsure.live/v2/asset/${widget.broker.assetId}/upload",
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
