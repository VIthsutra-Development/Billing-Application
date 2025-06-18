import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_billing/core/themes/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

class PDFScreen extends StatefulWidget {
  final String pdfUrl;
  const PDFScreen({super.key, required this.pdfUrl});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  String? localPdfPath;
  bool isLoading = true;
  bool isDownloading = false;

  @override
  void initState() {
    super.initState();
    _downloadToTemporaryDirectory();
  }

  // Download the PDF to a temporary directory for viewing
  Future<void> _downloadToTemporaryDirectory() async {
    try {
      final response = await http.get(Uri.parse(widget.pdfUrl));
      if (response.statusCode == 200) {
        final tempDir = await getTemporaryDirectory();
        final tempPath = '${tempDir.path}/temp_invoice.pdf';
        final file = File(tempPath);
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          localPdfPath = tempPath;
          isLoading = false;
        });
      } else {
        throw Exception("Failed to load PDF");
      }
    } catch (e) {
      print("Error loading PDF: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  // Request storage permissions
  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      if (!await Permission.storage.isGranted) {
        await Permission.storage.request();
      }
      if (!await Permission.manageExternalStorage.isGranted) {
        await Permission.manageExternalStorage.request();
      }
      if (!await Permission.storage.isGranted && !await Permission.manageExternalStorage.isGranted) {
        _showPermissionDialog();
      }
    }
  }

  // Show dialog if permission is denied
  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Storage Permission Required"),
          content: Text("Please grant storage permission in settings to download PDFs."),
          actions: [
            TextButton(
              onPressed: () async {
                await openAppSettings();
                Navigator.of(context).pop();
              },
              child: Text("Open Settings"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Get the BillSoft directory
  Future<Directory> _getCustomDownloadDirectory() async {
    return Directory('/storage/emulated/0/BillSoft');
  }

  // Download and save the PDF permanently
  Future<void> _downloadAndSavePdf() async {
    if (localPdfPath == null) return;
    await _requestPermissions();
    setState(() {
      isDownloading = true;
    });

    try {
      final directory = await _getCustomDownloadDirectory();
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      String timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final filePath = '${directory.path}/invoice_$timestamp.pdf';
      final file = File(filePath);
      await file.writeAsBytes(File(localPdfPath!).readAsBytesSync());

      setState(() {
        isDownloading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF Saved to: $filePath")),
      );
    } catch (e) {
      print("Error saving PDF: $e");
      setState(() {
        isDownloading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to save PDF: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Billsoft"),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: isDownloading ? null : _downloadAndSavePdf, // Disable when downloading
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: AppColors.blue , strokeCap: StrokeCap.round,))
          : localPdfPath == null
              ? Center(child: Text("Failed to load PDF"))
              : PDFView(filePath: localPdfPath!),
    );
  }
}
