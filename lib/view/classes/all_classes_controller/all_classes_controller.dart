import 'package:get/get.dart';

import '../../../db/db_helper.dart';
import '../../../models/student_model.dart';

class AllClassesController extends GetxController{
  List<StudentModel> studentList = [];

  getAllStudentByClassName(String className) {
    DBHelper.getAllStudentByClassName(className).listen((snapshot) {
      studentList = List.generate(snapshot.docs.length,
              (index) => StudentModel.fromMap(snapshot.docs[index].data()));
      update();
    });
  }

  deleteStudentByRollNo(num rollNo,String imageUrl, bool check) async {
    DBHelper.deleteStudentByRollNo(rollNo,imageUrl);
    if(check) Get.back();
    update();
  }
}