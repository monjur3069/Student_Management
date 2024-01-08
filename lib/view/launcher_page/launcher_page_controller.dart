import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../auth/auth_service.dart';
import '../../utils/constants.dart';


class LauncherPageController extends GetxController{

  @override
  void onInit() {
    EasyLoading.dismiss();
    Future.delayed(Duration.zero, () {
      if(AuthService.user == null) {
        Get.offNamed(loginPage);
        // Navigator.pushNamed(context, LoginPage.routeName);
      } else {
        Get.offAllNamed(dashBoardPage);
        // Navigator.pushReplacementNamed(context, DashboardPage.routeName);
      }
    });
    super.onInit();
  }
}