import 'package:get/get.dart';
import 'package:student_management/view/student_details_page/student_detailis_page_controller.dart';


class StudentDetailsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StudentDetailsPageController());
  }

}