import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../LoginScreen.dart';
import '../../Repositary/Models/get_asset_models/crypto_exchange.dart';
import '../../Utils/DisplayUtils.dart';
import '../Static_names_list/Crypto_Exchange.dart';
import '../get_asset_screens/crypto_exchange_screen.dart';

class CryptoExchangeEdit extends StatefulWidget {
  final CryptoExchange cryptoexchange;
  final String assetType;

  const CryptoExchangeEdit(
      {super.key, required this.cryptoexchange, required this.assetType});

  @override
  State<CryptoExchangeEdit> createState() => _CryptoExchangeEditState();
}

class _CryptoExchangeEditState extends State<CryptoExchangeEdit> {
  late String exchangeName;
  late String accountNumber;
  late String walletAddress;
  late String comments;
  late String attachment;

  String? _selectedCryptoExchange;
  List<Exchange> _cryptoExchange = [];

  var proof;
  final TextEditingController _attachmentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fetchCryptoExchangeNames();
    // Initialize the local variables with the current values
    exchangeName = widget.cryptoexchange.exchangeName;
    accountNumber = widget.cryptoexchange.accountNumber;
    walletAddress = widget.cryptoexchange.walletAddress ?? "";
    comments = widget.cryptoexchange.comments ?? "";
    attachment = widget.cryptoexchange.attachment ?? "";
  }

  Future<void> _fetchCryptoExchangeNames() async {
    const url = 'http://43.205.12.154:8080/v2/asset/static/cryptoExchanges';

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
        print('Response body: ${response.body}'); // Debugging purposes

        // Decode the response body
        final List<dynamic> data = json.decode(response.body);

        // Ensure the data is a list of strings or maps
        setState(() {
          _cryptoExchange = data.map((exchangeJson) {
            if (exchangeJson is Map<String, dynamic>) {
              return Exchange.fromJson(exchangeJson); // Map to Exchange
            } else if (exchangeJson is String) {
              return Exchange(name: exchangeJson); // Handle plain strings
            } else {
              throw Exception('Unexpected data type: $exchangeJson');
            }
          }).toList();

          _selectedCryptoExchange = _cryptoExchange
              .firstWhere(
                  (bank) => bank.name == widget.cryptoexchange.exchangeName)
              .name;
        });

        // Print fetched exchange names for debugging
        print(
            'Fetched exchange names: ${_cryptoExchange.map((exchange) => exchange.name).toList()}');
      } else {
        print(
            'Failed to load exchange names. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching exchange names: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Edit crypto exchange',
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildExchangeNameDropdown(),
              const SizedBox(height: 10),
              buildTextField(
                  labelText: 'Account number',
                  initialValue: accountNumber,
                  onChanged: (value) => setState(() => accountNumber = value),
                  isMandatory: true,
                  isNumeric: true),
              const SizedBox(height: 10),
              buildTextField(
                labelText: 'Wallet address',
                initialValue: walletAddress,
                onChanged: (value) => setState(() => walletAddress = value),
                isMandatory: false,
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
                  if (exchangeName.isEmpty) {
                    DisplayUtils.showToast('Please enter Exchange name');
                    return;
                  }
                  if (accountNumber.isEmpty) {
                    DisplayUtils.showToast('Please enter Account number');
                    return;
                  }

                  final updatedcryptoexchange = CryptoExchange(
                    exchangeName: _selectedCryptoExchange ?? '',
                    accountNumber: accountNumber,
                    walletAddress: walletAddress,
                    comments: comments,
                    attachment: attachment,
                    assetId: widget.cryptoexchange.assetId,
                    category: widget.assetType,
                  );

                  // Call API to update bank account details
                  final response =
                      await updatecryptoexchange(updatedcryptoexchange);
                  DisplayUtils.showToast('Crypto exchange asset details updated successfully');

                  Navigator.pop(context);
                  Navigator.pushReplacement<void, void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => CryptoExchangeScreen(
                        assetType: widget.assetType,
                      ),
                    ),
                  );
                  if (response != null) {
                  } else {}
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

  Widget buildExchangeNameDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Exchange name',
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
          value: _selectedCryptoExchange ?? '',
          isExpanded: true,
          // Set isExpanded to true
          onChanged: (value) {
            setState(() {
              _selectedCryptoExchange = value;
            });
          },
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('Select Exchange Name'),
            ),
            ..._cryptoExchange.map((cryptoExchange) {
              return DropdownMenuItem<String>(
                value: cryptoExchange.name,
                child: Text(cryptoExchange.name),
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

  Future<CryptoExchange?> updatecryptoexchange(
      CryptoExchange cryptoExchange) async {
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
        'https://dev.bsure.live/v2/asset/${cryptoExchange.assetId}',
        data: cryptoExchange
            .toJson(), // Convert account object to JSON and send as request body
      );

      await _submitImage();

      if (response.statusCode == 200) {
        return CryptoExchange.fromJson(jsonDecode(response.data));
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
        "https://dev.bsure.live/v2/asset/${widget.cryptoexchange.assetId}/upload",
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
