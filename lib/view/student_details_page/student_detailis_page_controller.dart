import 'package:get/get.dart';

import '../../db/db_helper.dart';

class StudentDetailsPageController extends GetxController{

  deleteStudentByRollNo(num rollNo,String imageUrl, bool check) async {
    DBHelper.deleteStudentByRollNo(rollNo,imageUrl);
    if(check) Get.back();
    update();
  }

}