import 'package:get/get.dart';

import 'dashboard_page_controller.dart';


class DashBoardPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardPageController());
  }

}