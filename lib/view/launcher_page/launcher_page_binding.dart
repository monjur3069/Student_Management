import 'package:get/get.dart';

import 'launcher_page_controller.dart';

class LauncherPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LauncherPageController());
    print('Laucher Page Binding Initalized');
  }

}