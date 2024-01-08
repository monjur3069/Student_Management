import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfView extends StatefulWidget {
  static const String routeName = '/pdf_view';
  String? path;

  PdfView({this.path,super.key});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  int? pages;

  bool isReady = false;

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: widget.path ?? "/data/data/com.example.kpcam/app_flutter/KPCAM/generated_pdf_1704301186350.pdf",
      enableSwipe: true,
      swipeHorizontal: false,
      autoSpacing: false,
      pageFling: true,
      onRender: (_pages) {
        setState(() {
          pages = _pages;
          isReady = true;
        });
      },
    );
  }
}
