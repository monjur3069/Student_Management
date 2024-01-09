import 'package:get/get.dart';
import 'package:student_management/view/settings_page/settings_page_controller.dart';

class SettingPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingPageController());
  }

}