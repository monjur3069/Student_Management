import 'package:get/get.dart';

import 'add_students_page_controller.dart';

class AddStudentsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddStudentsPageController());
  }

}