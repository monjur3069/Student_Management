import 'package:get/get.dart';
import 'package:student_management/view/view_students_page_page/view_students_page_controller.dart';


class ViewStudentsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ViewStudentsPageController());
  }

}