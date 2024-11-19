import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/mutual_fund_screen.dart';
import 'package:Bsure_devapp/Screens/Utils/DisplayUtils.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/mutual_fund.dart';
import '../Static_names_list/Mutualfund.dart';

class MutualFundEdit extends StatefulWidget {
  final MutualFund fund;
  final String assetType;

  const MutualFundEdit(
      {super.key, required this.assetType, required this.fund});

  @override
  State<MutualFundEdit> createState() => _MutualFundEditState();
}

class _MutualFundEditState extends State<MutualFundEdit> {
  late String amcName;
  late String schemeName;
  late String folioNumber;
  late String fundType;
  late String comments;
  late String attachment;
  File? selectedFile;

  var proof;
  var name;

  String? _selectedmutulFund;
  List<Fund> _mutualFunds = [];

  final TextEditingController _attachmentController = TextEditingController();
  final String category = 'MutualFund';

  @override
  void initState() {
    super.initState();

    _fetchMutualFunds();

    amcName = widget.fund.amcName ?? "";
    schemeName = widget.fund.schemeName ?? "";
    folioNumber = widget.fund.folioNumber ?? "";
    fundType = widget.fund.fundType ?? "";
    comments = widget.fund.comments ?? "";
    attachment = widget.fund.attachment ?? "";
  }

  Future<void> _fetchMutualFunds() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/mutualFunds';

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
        final List<dynamic> data = json.decode(response.body);

        if (data is List) {
          setState(() {
            _mutualFunds = data.map((bankJson) {
              if (bankJson is Map<String, dynamic>) {
                return Fund.fromJson(bankJson);
              } else if (bankJson is String) {
                return Fund(name: bankJson); // Adjust based on actual response
              } else {
                throw Exception('Unexpected data type: $bankJson');
              }
            }).toList();

            // Set the selected bank to the bank of the account being edited
            _selectedmutulFund = _mutualFunds
                .firstWhere((bank) => bank.name == widget.fund.amcName)
                .name;
          });

          print(
              'Fetched mutual funds: ${_mutualFunds.map((bank) => bank.name).toList()}');
        }
      } else {
        print(
            'Failed to load mutual funds. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching mutual funds: $e');
    }
  }

  Future<void> _uploadFile(String assetId, String token) async {
    if (selectedFile == null) return;

    try {
      var uri = Uri.parse('http://13.234.213.250:8080/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);
      request.headers['Authorization'] = token;
      request.fields['assetId'] = assetId;

      request.files.add(http.MultipartFile.fromBytes(
        "attachment",
        await selectedFile!.readAsBytes(),
        filename: attachment,
      ));

      var response = await request.send();
      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        setState(() {
          attachment = jsonResponse['fileUrl'];
        });
        DisplayUtils.showToast("File uploaded successfully");
      } else {
        DisplayUtils.showToast("File upload failed: ${response.statusCode}");
      }
    } catch (e) {
      DisplayUtils.showToast("Error uploading file: $e");
    }
  }

  Future<MutualFund?> _updateMutualFund(MutualFund fund) async {
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
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.put(
        'https://dev.bsure.live/v2/asset/${fund.assetId}',
        data: fund.toJson(),
      );

      await _submitImage();

      if (response.statusCode == 200) {
        if (selectedFile != null) {
          await _uploadFile(fund.assetId.toString(), token.toString());
        }
        DisplayUtils.showToast("MutualFund asset details updated successfully");
        return MutualFund.fromJson(response.data);
      } else {
        DisplayUtils.showToast("Update failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      DisplayUtils.showToast("Error updating details: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit mutual fund',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildMutualFundDropdown(),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Scheme name',
                initialValue: schemeName,
                onChanged: (value) => setState(() => schemeName = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Folio number',
                initialValue: folioNumber,
                onChanged: (value) => setState(() => folioNumber = value),
                isMandatory: false,
                isNumeric: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                labelText: 'Fund type',
                initialValue: fundType,
                onChanged: (value) => setState(() => fundType = value),
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
                  // Validate form fields
                  if (amcName.isEmpty) {
                    DisplayUtils.showToast("Please enter Amc name");
                    return;
                  }

                  final updatedFund = MutualFund(
                    amcName: _selectedmutulFund ?? '',
                    schemeName: schemeName,
                    folioNumber: folioNumber,
                    fundType: fundType,
                    comments: comments,
                    attachment: attachment,
                    category: widget.assetType,
                    assetId: widget.fund.assetId,
                  );

                  final response = await _updateMutualFund(updatedFund);

                  if (response != null) {
                    Navigator.pop(context);
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => MutualFundScreen(
                          assetType: widget.assetType,
                        ),
                      ),
                    );
                  } else {
                    // Handle failure
                  }
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

  Widget buildMutualFundDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'AMC Name',
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
          value: _selectedmutulFund ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedmutulFund = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select AMC Name'),
            ),
            ..._mutualFunds.map((mutualfund) {
              return DropdownMenuItem<String>(
                value: mutualfund.name,
                child: Text(mutualfund.name),
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
        selectedFile = File(result.files.single.path!);
        _attachmentController.text = result.files.single.name;
      });
    } else {
      DisplayUtils.showToast("No file selected");
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
        "https://dev.bsure.live/v2/asset/${widget.fund.assetId}/upload",
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
