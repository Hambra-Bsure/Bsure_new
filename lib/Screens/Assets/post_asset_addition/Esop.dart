import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/AssetModels/EsopRequest.dart';
import '../../Repositary/Retrofit/node_api_client.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/esop_screen.dart';

class EsopAdd extends StatefulWidget {
  final String assetType;

  const EsopAdd({Key? key, required this.assetType}) : super(key: key);

  @override
  _EsopAddState createState() => _EsopAddState();
}

class _EsopAddState extends State<EsopAdd> {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _numberOfStocksController =
      TextEditingController();
  final TextEditingController _optionPriceController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _totalSharesController = TextEditingController();
  final TextEditingController _issuePriceController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  final TextEditingController _attachmentController = TextEditingController();

  File? file;
  String? fileName;
  String? downloadUrl;
  String? assetId;
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Esop', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(
              controller: _companyNameController,
              labelText: 'Company name',
              mandatory: true,
            ),
            buildTextField(
              controller: _numberOfStocksController,
              labelText: 'Number of stocks',
              mandatory: true,
              isNumeric: true,
            ),
            buildTextField(
              controller: _optionPriceController,
              labelText: 'Option price',
              mandatory: false,
              isNumeric: true,
            ),
            buildDateField(
              controller: _expiryDateController,
              labelText: 'Expiry date',
              mandatory: false,
            ),
            buildTextField(
              controller: _totalSharesController,
              labelText: 'Total shares available',
              mandatory: false,
              isNumeric: true,
            ),
            buildTextField(
              controller: _issuePriceController,
              labelText: 'Issue price per share',
              mandatory: false,
              isNumeric: true,
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
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
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
                  onPressed: submitImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(color: Colors.white)),
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
        file = File(result.files.single.path!);
        _attachmentController.text = result.files.single.name;
      });
    } else {
      // Handle error when no file is selected.
      print('No file selected.');
    }
  }

  Future<void> submitImage() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var uri = Uri.parse('https://dev.bsure.live/v2/asset/attachment');
      var request = http.MultipartRequest('POST', uri);

      // Set headers
      request.headers['Authorization'] = token.toString();

      // Add asset ID as a field
      request.fields['assetId'] = assetId!;

      // Add file as a MultipartFile
      request.files.add(await http.MultipartFile.fromPath(
        'attachment',
        file!.path,
        filename: _attachmentController.text,
      ));

      var response = await request.send();
      print("Response: ${response.statusCode}");

      if (response.statusCode == 201) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        var fileUrl = jsonResponse[
            'fileUrl']; // Assuming the server returns the file URL in 'fileUrl' key
        var returnedAssetId = jsonResponse[
            'assetId']; // Assuming the server returns the asset ID in 'assetId' key
        // Handle the file URL and asset ID
        print('File URL: $fileUrl');
        print('Asset ID: $returnedAssetId');

        // Show success message and navigate to the EsopScreen
        DisplayUtils.showToast("File uploaded successfully");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EsopScreen(assetType: widget.assetType),
          ),
        );
      } else {
        // Handle error response
        print('Failed to upload file: ${response.statusCode}');
        print(await response.stream.bytesToString());
        // Show error message and navigate to the EsopScreen even if upload fails
        DisplayUtils.showToast("Failed to upload file");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EsopScreen(assetType: widget.assetType),
          ),
        );
      }
    } catch (e) {
      // Handle exception
      print('Error uploading file: $e');
      // Show error message and navigate to the EsopScreen in case of error
      DisplayUtils.showToast("Error uploading file: $e");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EsopScreen(assetType: widget.assetType),
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
          maxLines: null,
          // Allow multiline input for comments
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget buildDateField({
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
        InkWell(
          onTap: () {
            _selectDate(context);
          },
          child: IgnorePointer(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _expiryDateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() async {
    if (_companyNameController.text.isEmpty ||
        _numberOfStocksController.text.isEmpty) {
      if (_companyNameController.text.isEmpty) {
        DisplayUtils.showToast('Company name is required');
      } else if (_numberOfStocksController.text.isEmpty) {
        DisplayUtils.showToast('Number of stocks is required');
      }
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    // Check if token is null or empty
    if (token == null || token.isEmpty) {
      // Handle the case where token is not available
      DisplayUtils.showToast('Token not found');
      return;
    }

    final dio = Dio();
    final client = NodeClient(dio);

    // Proceed with form submission logic here...
    final esopRequest = EsopRequest(
      assetType: widget.assetType,
      companyName: _companyNameController.text,
      numberOfStocks: int.tryParse(_numberOfStocksController.text),
      optionPrice: int.tryParse(_optionPriceController.text),
      expiryDate: _expiryDateController.text.isEmpty
          ? null
          : _expiryDateController.text,
      totalSharesAvailableForIssue: int.tryParse(_totalSharesController.text),
      issuePricePerShare: int.tryParse(_issuePriceController.text),
      comments: _commentsController.text,
      attachment: _attachmentController.text,
    );

    try {
      final response = await client.CreateEsop(token!, esopRequest);

      setState(() {
        assetId = response.asset?.esop?.assetId.toString();
      });
      // Handle the response as needed
      if (response.success == 200) {
        DisplayUtils.showToast("Esop details added successfully");
        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EsopScreen(assetType: widget.assetType),
          ),
        );
      } else {
        // DisplayUtils.showToast("Failed to add Esop details");
      }
    } catch (e) {
      // Handle errors
      DisplayUtils.showToast("Error: $e");
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
