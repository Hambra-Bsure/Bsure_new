import 'dart:convert';
import 'package:Bsure_devapp/Screens/Repositary/Models/get_asset_models/loan_given.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/DisplayUtils.dart';
import '../get_asset_screens/loan_given_screen.dart';

class LoanGivenEdit extends StatefulWidget {
  final LoanGiven loan;
  final String assetType;

  const LoanGivenEdit({super.key, required this.loan, required this.assetType});

  @override
  State<LoanGivenEdit> createState() => _LoanGivenEditState();
}

class _LoanGivenEditState extends State<LoanGivenEdit> {
  late String borrowerName;
  late String loanAmount;
  late DateTime loanGivenDate;
  late String interestRate;
  late String comments;
  late String attachment;

  var proof;
  final TextEditingController _attachmentController = TextEditingController();
  final TextEditingController _maturityDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the local variables with the current values
    borrowerName = widget.loan.borrowerName ?? '';
    loanAmount = widget.loan.loanAmount?.toString() ?? '';
    loanGivenDate = DateTime.parse(
        widget.loan.loanGivenDate ?? DateTime.now().toIso8601String());
    interestRate = widget.loan.interestRate?.toString() ?? '';
    comments = widget.loan.comments ?? '';
    attachment = widget.loan.attachment ?? '';
    _maturityDateController.text = formatDate(loanGivenDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit loan given',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTextField(
                labelText: 'Borrower name',
                initialValue: borrowerName,
                onChanged: (value) => setState(() => borrowerName = value),
                isMandatory: true,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Loan amount',
                initialValue: loanAmount,
                onChanged: (value) => setState(() => loanAmount = value),
                isMandatory: true,
                isNumeric: true
              ),
              const SizedBox(height: 10),
              buildDateField(
                controller: _maturityDateController,
                labelText: 'Maturity date',
                mandatory: false,
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Interest rate',
                initialValue: interestRate,
                onChanged: (value) => setState(() => interestRate = value),
                isMandatory: false,
                isNumeric: true
              ),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Comments',
                initialValue: comments,
                onChanged: (value) => setState(() => comments = value),
                isMandatory: false,
              ),
              const SizedBox(height: 10),
              buildAttachmentField(),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (borrowerName.isEmpty) {
                    DisplayUtils.showToast('Please enter Borrower name');
                    return;
                  }

                  if (loanAmount.isEmpty) {
                    DisplayUtils.showToast('Please enter loan amount');
                    return;
                  }

                  // Ensure interest rate and comments are not empty
                  final interestRateValue =
                      interestRate.isNotEmpty ? int.parse(interestRate) : 0;
                  final commentsValue = comments.isNotEmpty ? comments : '';

                  final updatedLoan = LoanGiven(
                    borrowerName: borrowerName,
                    loanAmount: int.parse(loanAmount),
                    loanGivenDate: loanGivenDate.toIso8601String(),
                    interestRate: interestRateValue,
                    comments: commentsValue,
                    attachment: attachment,
                    assetId: widget.loan.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update loan details
                  final response = await updateLoan(updatedLoan);

                  DisplayUtils.showToast('Asset updated successfully');
                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => LoanGivenScreen(
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
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        loanGivenDate = picked; // Assign DateTime directly
        _maturityDateController.text =
            formatDate(loanGivenDate); // Update text field
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

  Future<LoanGiven?> updateLoan(LoanGiven loanGiven) async {
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
        'http://43.205.12.154:8080/v2/asset/${loanGiven.assetId}',
        data: loanGiven
            .toJson(), // Convert loanGiven object to JSON and send as request body
      );

      if (response.statusCode == 200) {
       // DisplayUtils.showToast("LoanGiven Details Updated Successfully");
        return LoanGiven.fromJson(jsonDecode(response.data));
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