import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Will_subscription/Will_products.dart';

class PdfDownloadScreen extends StatefulWidget {
  @override
  _PdfDownloadScreenState createState() => _PdfDownloadScreenState();
}

class _PdfDownloadScreenState extends State<PdfDownloadScreen> {
  bool _isDownloading = false;
  String _message = '';
  String? _localPath;

  Future<void> _downloadPdf() async {
    setState(() {
      _isDownloading = true;
      _message = 'Downloading...';
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    try {
      final response = await http.get(
        Uri.parse('https://dev.bsure.live/v2/will/pdf'),
        headers: {
          'Authorization': token.toString(),
        },
      );

      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/downloaded_pdf.pdf';
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          _isDownloading = false;
          _message = 'Downloaded to: $filePath';
          _localPath = filePath;
        });

        // Navigate to payment screen upon successful download
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentScreen()),
        );

        // Log the file path to console for debugging
        print('File downloaded to: $filePath');
      } else {
        setState(() {
          _isDownloading = false;
          _message =
              'Failed to download PDF. Status code: ${response.statusCode}';
        });

        // Log detailed error message
        print('Failed to download PDF. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _message = 'Error: $e';
      });

      // Log the error
      print('Error: $e');
    }
  }

  void _viewPdf() {
    if (_localPath != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewScreen(filePath: _localPath!),
        ),
      );
    }
  }

  void _continue() {
    // Implement the action to continue to the next step
    print('Continue button pressed');
  }

  void _sharePdf() {
    if (_localPath != null) {
      Share.shareFiles([_localPath!], text: 'Check out this PDF!');
    }
  }

  void _cancelDownload() {
    setState(() {
      _isDownloading = false;
      _message = 'Download cancelled';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Pdf downloader and viewer',
            style: TextStyle(color: Colors.white)),
      ),
      body: _isDownloading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _cancelDownload,
                    child: const Text('Cancel Download'),
                  ),
                ],
              ),
            )
          : _localPath == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WillProductsScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff429bb8)),
                        child: const Text('Download will pdf',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 20),
                      Text(_message),
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _viewPdf,
                        child: const Text('View Pdf'),
                      ),
                      ElevatedButton(
                        onPressed: _continue,
                        child: const Text('Continue'),
                      ),
                      ElevatedButton(
                        onPressed: _sharePdf,
                        child: const Text('Share Pdf'),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class PDFViewScreen extends StatelessWidget {
  final String filePath;

  PDFViewScreen({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pdf Viewer'),
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Screen'),
      ),
      body: const Center(
        child: Text('Implement your payment process here.'),
      ),
    );
  }
}
