import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/student_model.dart';

class DBHelper {
  static const String _collectionStudent = 'Student';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addStudent(StudentModel studentModel) {
    final doc = _db.collection(_collectionStudent).doc();
    return doc.set(studentModel.toMap());
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getStudentByFieldName(num rollNo) =>
      _db.collection(_collectionStudent).where(tableColRollNo, isEqualTo: rollNo).get();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllStudentByClassName(String className) =>
      _db.collection(_collectionStudent).where('class_name', isEqualTo: className).snapshots();

  static deleteStudentByRollNo(num rollNo, String imageUrl) async {
/*    // Get a reference to the collection
    CollectionReference students = FirebaseFirestore.instance.collection(_collectionStudent);

    // Query the collection to find the document with the matching roll number
    QuerySnapshot querySnapshot = await students.where(tableColRollNo, isEqualTo: rollNo).get();*/
  QuerySnapshot querySnapshot = await getStudentByFieldName(rollNo);
    if (querySnapshot.docs.isNotEmpty) {
      // Get the document reference
      DocumentReference documentReference = querySnapshot.docs.first.reference;

      // Delete the document
      await documentReference.delete();

      //Delete the image
      await deleteFileFromFirebaseStorage(imageUrl);

    } else {
      print('Document with roll number $rollNo not found.');
    }
  }

  static deleteFileFromFirebaseStorage(String imageUrl) async {
    //Delete the image
    final storageReference = FirebaseStorage.instance.refFromURL(imageUrl);
    await storageReference.delete();
  }
}
