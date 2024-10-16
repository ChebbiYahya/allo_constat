import 'package:flutter/material.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';

class PdfViewerPage extends StatefulWidget {
  final String? pdfUrl;
  const PdfViewerPage({super.key, this.pdfUrl});

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl!);
    setState(() {});
  }

  @override
  void initState() {
    initialisePdf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Image.asset(
            "assets/images/appbar_image.png",
            height: 100,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: document != null
            ? PDFViewer(document: document!)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
