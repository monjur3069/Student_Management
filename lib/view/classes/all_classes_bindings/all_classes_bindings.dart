import 'package:get/get.dart';

import '../all_classes_controller/all_classes_controller.dart';

class AllClassedBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllClassesController());
  }

}