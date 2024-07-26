import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Repositary/Models/get_asset_models/bond.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/bond_screen.dart';

class BondEdit extends StatefulWidget {
  final Bond bond;
  final String assetType;

  const BondEdit({Key? key, required this.bond, required this.assetType})
      : super(key: key);

  @override
  State<BondEdit> createState() => _BondEditState();
}

class _BondEditState extends State<BondEdit> {
  late String bondName;
  late String bondNumber;
  late String authorityWhoIssuedTheBond;
  late String typeOfBond;
  late String maturityDate; // Changed to String type
  late String comments;
  late String attachment;

  var proof;
  final TextEditingController _attachmentController = TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    bondName = widget.bond.bondName ?? '';
    bondNumber = widget.bond.bondNumber ?? '';
    authorityWhoIssuedTheBond = widget.bond.authorityWhoIssuedTheBond ?? '';
    typeOfBond = widget.bond.typeOfBond ?? '';
    maturityDate = widget.bond.maturityDate ?? '';
    comments = widget.bond.comments ?? '';
    attachment = widget.bond.attachment ?? '';

    // Set initial value to the _maturityDateController
    _maturityDateController.text = maturityDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit bond', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                initialValue: bondName,
                labelText: 'Bond name',
                onChanged: (value) => setState(() => bondName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: bondNumber,
                labelText: 'Bond number',
                onChanged: (value) => setState(() => bondNumber = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: authorityWhoIssuedTheBond,
                labelText: 'Authority who issued the bond',
                onChanged: (value) =>
                    setState(() => authorityWhoIssuedTheBond = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildTextField(
                initialValue: typeOfBond,
                labelText: 'Type of bond',
                onChanged: (value) => setState(() => typeOfBond = value),
                isMandatory: true,
              ),
              const SizedBox(height: 16.0),
              buildDateField(
                controller: _maturityDateController,
                labelText: 'Maturity date',
                mandatory: true,
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
                  if (bondName.isEmpty) {
                    DisplayUtils.showToast('Please enter Bond name.');
                    return;
                  }

                  if (bondNumber.isEmpty) {
                    DisplayUtils.showToast('Please enter Bond number.');
                    return;
                  }

                  if (authorityWhoIssuedTheBond.isEmpty) {
                    DisplayUtils.showToast(
                        'Please enter authority issued bond.');
                    return;
                  }

                  if (typeOfBond.isEmpty) {
                    DisplayUtils.showToast('Please enter type of bond.');
                    return;
                  }

                  if (maturityDate.isEmpty) {
                    DisplayUtils.showToast('Please select maturity date.');
                    return;
                  }

                  final updatedbond = Bond(
                    bondName: bondName,
                    bondNumber: bondNumber,
                    authorityWhoIssuedTheBond: authorityWhoIssuedTheBond,
                    typeOfBond: typeOfBond,
                    maturityDate: maturityDate,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.bond.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update bond details
                  final response = await updateBond(updatedbond);

                  DisplayUtils.showToast('Asset updated successfully');
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => BondScreen(
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
    if (picked != null) {
      setState(() {
        maturityDate = formatDate(picked); // Convert DateTime to String
        _maturityDateController.text = maturityDate; // Update text field
      });
    }
  }

  String formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
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

  Future<Bond?> updateBond(Bond bond) async {
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
        'https://dev.bsure.live/v2/asset/${bond.assetId}',
        data: bond
            .toJson(), // Convert bond object to JSON and send as request body
      );

      await _submitImage();

      if (response.statusCode == 200) {
        // Parse and return updated bond details
        return Bond.fromJson(jsonDecode(response.data));
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
      return;
    }

    final formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(proof.path),
    });

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      await dio.post(
        "https://dev.bsure.live/v2/asset/${widget.bond.assetId}/upload",
        data: formData,
      );
    } catch (e) {
      DisplayUtils.showToast('Failed to upload file');
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