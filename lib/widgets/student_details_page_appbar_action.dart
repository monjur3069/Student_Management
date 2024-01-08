import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

import '../models/student_model.dart';
import '../view/pdf_page/pdf_view.dart';
import '../view/pdf_page/pdf_view2.dart';
import '../view/student_details_page/student_detailis_page_controller.dart';

class StudentDetailsPageAppbarAction extends StatelessWidget {
  StudentDetailsPageController controller;
  StudentModel studentModel;
  File? pickedFile;
  StudentDetailsPageAppbarAction({
    required this.controller,
    required this.studentModel,
    super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 1,
          child: Text('Update'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Delete'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Make Pdf'),
        ),
        const PopupMenuItem(
          value: 4,
          child: Text('Picked File'),
        ),
        const PopupMenuItem(
          value: 5,
          child: Text('Show Pdf'),
        ),
        // Add more options as needed
      ],
      onSelected: (value) {
        // Handle the selected option
        switch (value) {
          case 1:
          // Handle Option 2
            break;
          case 2:
            controller.deleteStudentByRollNo(studentModel.rollNo,
                studentModel.imageUrl, true);
            break;

          case 3:
            _makePdf();
            break;
          case 4:
            _pickPdf(context);
            break;
          case 5:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PdfView2()));
            break;
        // Add more cases as needed
        }
      },
    );
  }

  void _makePdf() async{
    final pdf = pw.Document();
    final img = await rootBundle.load('assets/images/logo.jpg');
    final imageBytes = img.buffer.asUint8List();


    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Stack(
            children: [
              pw.Image(pw.MemoryImage(imageBytes))
            ]
          ); // Center
        }));

    if (await Permission.storage.request().isGranted){
      final externalStorageDirectory = await getExternalStorageDirectory();

      // Specify the folder name within the external storage
      final String folderName = 'MyPDFs';
      final Directory folder = Directory('${externalStorageDirectory!.path}/$folderName');
      if (!folder.existsSync()) {
        folder.createSync();
      }

      // Generate a unique file name for the PDF
      final String pdfFileName = 'generated_pdf_${DateTime.now().millisecondsSinceEpoch}.pdf';

      // Save the PDF to a file in external storage
      final file = File("${folder.path}/$pdfFileName");
      await file.writeAsBytes(await pdf.save());

      print('PDF saved at: ${file.path}');
    }else {
      print('Storage permission not granted');
      // Handle the case where permission is not granted
    }
  }

  Future<void> _pickPdf(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      pickedFile = File(result.files.single.path!);
      // Optionally, show a loading indicator while opening the PDF
      // ...
    } else {
      // Handle the case when no file is picked
      // ...
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PdfView(path:pickedFile!.path)));
  }
}
