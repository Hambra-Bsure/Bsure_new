import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfDownloadScreen extends StatefulWidget {
  final String pdfUrl;

  const PdfDownloadScreen({super.key, required this.pdfUrl});

  @override
  _PdfDownloadScreenState createState() => _PdfDownloadScreenState();
}

class _PdfDownloadScreenState extends State<PdfDownloadScreen> {
  bool _isDownloading = false;
  String _message = '';
  String? _localPath;

  Future<void> _downloadPdf(bool spouseConsent) async {
    setState(() {
      _isDownloading = true;
      _message = 'Downloading...';
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.get("token");

    if (token == null) {
      _showErrorDialog('Invalid Token', 'Please log in again.');
      setState(() => _isDownloading = false);
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('http://43.205.12.154:8080/v2/will/pdf'),
        headers: {
          'Authorization': token.toString(), // Add Bearer prefix if required
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"spouseConsent": spouseConsent}),
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

        // Navigate to payment screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentScreen()),
        );
      } else {
        _handleDownloadError(
          'Failed to download PDF',
          'Status code: ${response.statusCode}\nResponse: ${response.body}',
        );
      }
    } catch (e) {
      _handleDownloadError('Error', e.toString());
    }
  }

  void _handleDownloadError(String title, String errorDetails) {
    setState(() {
      _isDownloading = false;
      _message = '$title: $errorDetails';
    });
    print('Error: $title\nDetails: $errorDetails');
    _showErrorDialog(title, errorDetails);
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
        title: const Text('PDF Downloader and Viewer',
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
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _downloadPdf(true), // Set to true or false
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8)),
              child: const Text('Download Will PDF (Consent True)',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _downloadPdf(false), // Download without consent
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8)),
              child: const Text('Download Will PDF (Consent False)',
                  style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Text(_message),
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
        title: const Text('PDF Viewer'),
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
