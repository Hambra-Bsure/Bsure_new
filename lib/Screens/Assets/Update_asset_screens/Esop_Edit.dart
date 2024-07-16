import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/esop.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/esop_screen.dart';

class EsopEdit extends StatefulWidget {
  final Esop esop;
  final String assetType;

  const EsopEdit({Key? key, required this.esop, required this.assetType})
      : super(key: key);

  @override
  State<EsopEdit> createState() => _EsopEditState();
}

class _EsopEditState extends State<EsopEdit> {
  late String companyName;
  late String numberOfStocks;
  late String optionPrice;
  late DateTime expiryDate; // Change to DateTime type
  late String totalSharesAvailableForIssue;
  late String issuePricePerShare;
  late String comments;
  late String attachment;

  var proof;
  final TextEditingController _attachmentController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize the local variables with the current values
    companyName = widget.esop.companyName ?? '';
    numberOfStocks = widget.esop.numberOfStocks?.toString() ?? '';
    optionPrice = widget.esop.optionPrice?.toString() ?? '';
    expiryDate = widget.esop.expiryDate != null
        ? DateTime.parse(widget.esop.expiryDate!)
        : DateTime
            .now(); // Parse String to DateTime or fallback to DateTime.now()
    totalSharesAvailableForIssue =
        widget.esop.totalSharesAvailableForIssue?.toString() ?? '';
    issuePricePerShare = widget.esop.issuePricePerShare?.toString() ?? '';
    comments = widget.esop.comments ?? '';
    attachment = widget.esop.attachment ?? '';

    // Set initial value to the _expiryDateController
    _expiryDateController.text = formatDate(expiryDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit esop', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                initialValue: companyName,
                labelText: 'Company name',
                onChanged: (value) => setState(() => companyName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: numberOfStocks,
                labelText: 'Number of stocks',
                onChanged: (value) => setState(() => numberOfStocks = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: optionPrice,
                labelText: 'Option price',
                onChanged: (value) => setState(() => optionPrice = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildDateField(
                controller: _expiryDateController,
                labelText: 'Expiry date', // Corrected label
                mandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: totalSharesAvailableForIssue,
                labelText: 'Total shares available for issue',
                onChanged: (value) =>
                    setState(() => totalSharesAvailableForIssue = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: issuePricePerShare,
                labelText: 'Issue price per share',
                onChanged: (value) =>
                    setState(() => issuePricePerShare = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: comments,
                labelText: 'Comments',
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 16.0),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (companyName.isEmpty) {
                    DisplayUtils.showToast('Please enter Company name.');
                    return;
                  }

                  if (numberOfStocks.isEmpty) {
                    DisplayUtils.showToast('Please enter Number of stocks.');
                    return;
                  }

                  final updatedEsop = Esop(
                    companyName: companyName,
                    numberOfStocks: int.tryParse(numberOfStocks),
                    optionPrice: int.tryParse(optionPrice),
                    expiryDate: formatDate(expiryDate),
                    // Format DateTime to String for API
                    totalSharesAvailableForIssue:
                        int.tryParse(totalSharesAvailableForIssue),
                    issuePricePerShare: int.tryParse(issuePricePerShare),
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.esop.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update Esop details
                  final response = await updateEsop(updatedEsop);

                  DisplayUtils.showToast('Asset updated successfully');
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => EsopScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xff429bb8), // Set background color here
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
      initialDate: expiryDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != expiryDate) {
      setState(() {
        expiryDate = picked;
        _expiryDateController.text = formatDate(expiryDate);
      });
    }
  }



  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
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
                  hintText: "Select File",
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

  Future<Esop?> updateEsop(Esop esop) async {
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
        'https://dev.bsure.live/v2/asset/${esop.assetId}',
        data: esop
            .toJson(), // Convert Esop object to JSON and send as request body
      );

      if (response.statusCode == 200) {
        return Esop.fromJson(jsonDecode(response.data));
      } else {
        return null; // Return null if update fails
      }
    } catch (e) {
      return null; // Return null if an error occurs
    }
  }
}



class NoLeadingSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    }
    return newValue;
  }
}