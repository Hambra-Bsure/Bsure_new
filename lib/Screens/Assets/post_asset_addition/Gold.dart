import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this for TextInputFormatter
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../Repositary/Models/AssetModels/GoldRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/gold_screen.dart';

class GoldAdd extends StatefulWidget {
  final String assetType;

  const GoldAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _GoldAddState createState() => _GoldAddState();
}

enum MetalType { Gold, Silver }

enum Type { Ring, Earing, Necklace }

class _GoldAddState extends State<GoldAdd> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _whereItIsKeptController =
  TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  MetalType? _selectedMetalType;
  Type? _selectedType;

  File? proof;
  String? assetId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Gold', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdownField(
              value: _selectedMetalType,
              onChanged: (value) {
                setState(() {
                  _selectedMetalType = value as MetalType?;
                });
              },
              items: MetalType.values.map((type) {
                return DropdownMenuItem<MetalType>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              labelText: 'Metal type',
              mandatory: true,
            ),
            buildDropdownField(
              value: _selectedType,
              onChanged: (value) {
                setState(() {
                  _selectedType = value as Type?;
                });
              },
              items: Type.values.map((type) {
                return DropdownMenuItem<Type>(
                  value: type,
                  child: Text(type.toString().split('.').last),
                );
              }).toList(),
              labelText: 'Type',
              mandatory: true,
            ),
            buildTextField(
                controller: _weightController,
                labelText: 'Weight (in grams)',
                mandatory: true,
                isNumeric: true),
            buildTextField(
              controller: _whereItIsKeptController,
              labelText: 'Where it is kept',
              mandatory: false,
            ),
            buildTextField(
              controller: _commentsController,
              labelText: 'Comments',
              mandatory: false,
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child:
                const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20),
            Column(
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
                          hintText: "Select file",
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
                        'File',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await submitImage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child:
                  const Text('Submit', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> uploadFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      setState(() {
        proof = File(result.files.single.path!);
        _attachmentController.text = result.files.single.name;
      });
    } else {
      print('No file selected.');
    }
  }

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (proof == null || token == null || token.isEmpty || assetId == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GoldScreen(
            assetType: widget.assetType,
          ),
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse(
          'https://dev.bsure.live/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);

      request.headers['Authorization'] = token;

      request.fields['assetId'] = assetId!;

      if (proof != null) {
        request.files.add(http.MultipartFile.fromBytes(
          "attachment",
          proof!.readAsBytesSync(),
          filename: proof!.path.split('/').last,
        ));
      }

      var response = await request.send();
      print("Response: ${response.statusCode}");

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);

        print('File URL: ${jsonResponse['fileUrl']}');
        print('Asset ID: ${jsonResponse['assetId']}');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GoldScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      } else {
        print('Failed to upload file: ${response.statusCode}');
        print(await response.stream.bytesToString());

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GoldScreen(
              assetType: widget.assetType,
            ),
          ),
        );
      }
    } catch (e) {
      print('Error uploading file: $e');

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GoldScreen(
            assetType: widget.assetType,
          ),
        ),
      );
    }
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool mandatory = false,
    bool isNumeric = false,
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
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDropdownField({
    required dynamic value,
    required ValueChanged<dynamic> onChanged,
    required List<DropdownMenuItem<dynamic>> items,
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
        DropdownButtonFormField<dynamic>(
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

  void _submitForm() async {
    if (_selectedMetalType == null ||
        _selectedType == null ||
        _weightController.text.isEmpty) {
      if (_selectedMetalType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Metal type is required')),
        );
      } else if (_selectedType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Type is required')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Weight in grams is required')),
        );
      }
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    final request = GoldRequest(
      assetType: widget.assetType,
      metalType: _selectedMetalType.toString().split('.').last,
      type: _selectedType.toString().split('.').last,
      weightInGrams: int.parse(_weightController.text),
      whereItIsKept: _whereItIsKeptController.text,
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateGold(token, request);

      setState(() {
        assetId = response.asset!.gold!.assetId.toString();
      });

      if (response.success == 200) {
        DisplayUtils.showToast("Gold details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GoldScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
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
