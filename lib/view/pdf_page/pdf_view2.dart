import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class PdfView2 extends StatefulWidget {
  const PdfView2({super.key});

  @override
  State<PdfView2> createState() => _PdfView2State();
}

class _PdfView2State extends State<PdfView2> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController pdfViewerController = PdfViewerController();
  OverlayEntry? _overlayEntry;
  late var currentPageNumber;

  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        key: _pdfViewerKey,
        enableTextSelection: true,
        controller: pdfViewerController,
        // onAnnotationAdded: _annotationAdded,
        onPageChanged: (PdfPageChangedDetails details){
          currentPageNumber = details.newPageNumber;
          print('New page number: $currentPageNumber');
        },
        onTextSelectionChanged: (PdfTextSelectionChangedDetails details){
          if (details.selectedText == null && _overlayEntry != null) {
            _overlayEntry!.remove();
            _overlayEntry = null;
          } else if (details.selectedText != null && _overlayEntry == null) {
            _showContextMenu(context, details);
          }
        }
      ),
    );
  }

  void _annotationAdded(Annotation annotation) {
    // Get the selected text lines.
    List<PdfTextLine>? textLines =
    _pdfViewerKey.currentState?.getSelectedTextLines();
    if (textLines != null && textLines.isNotEmpty) {
      print("Called");
      // Create the highlight annotation.
      final HighlightAnnotation highlightAnnotation = HighlightAnnotation(
        textBoundsCollection: textLines,
      );
      // Add the annotation to the PDF document.
      pdfViewerController.addAnnotation(highlightAnnotation);
    }
  }




  void _textSelectionChanged(PdfTextSelectionChangedDetails details){
    final selectedText = details.selectedText;
    final globalSelectedRegion = details.globalSelectedRegion;

    final highlights = currentPageNumber?.annotations
        ?.whereType<PdfTextMarkupAnnotation>()
        ?.map((annotation) => {
      'bounds': annotation.bounds.toString(),
      'color': annotation.color.toArgb(),
    })
        ?.toList() ?? [];

    final data = {
      'text': selectedText,
      'page': currentPageNumber,
      'highlights': highlights,
    };

    final jsonData = jsonEncode(data);
    SharedPreferences.getInstance().then((prefs) => prefs.setStringList('highlights', [jsonData]));
    print(data);
    print(jsonData);
  }

  void _showContextMenu(BuildContext context, PdfTextSelectionChangedDetails details) {
    final OverlayState overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: details.globalSelectedRegion!.center.dy - 55,
        right: details.globalSelectedRegion!.bottomLeft.dx,
        child: ElevatedButton(
          onPressed: () {
            if (details.selectedText != null) {
              Clipboard.setData(ClipboardData(text: details.selectedText!));
              print('Text copied to clipboard: ${details.selectedText}');
              pdfViewerController.clearSelection();
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            )),
          ),
          child: const Text('Copy', style: TextStyle(fontSize: 17)),
        ),
      ),
    );
    overlayState.insert(_overlayEntry!);
  }
}
