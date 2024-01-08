import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../auth/auth_service.dart';
import '../../utils/constants.dart';
import '../../utils/dashboard_page_item.dart';



class DashBoardPageController extends GetxController{

  @override
  void onInit() {
    EasyLoading.dismiss();
    super.onInit();
  }

  navigate(String value) {
    String route = '';
    switch(value) {
      case DashboardPageItem.addStudents:
        route = addStudentsPage;
        break;
      case DashboardPageItem.viewStudents:
        route = viewStudentsPage;
        break;
      case DashboardPageItem.payTuitionFees:
        route = '';
        break;
      case DashboardPageItem.user:
        route = '';
        break;
      case DashboardPageItem.settings:
        route = '';
        break;
      case DashboardPageItem.report:
        route = '';
        break;
    }
    return route;
  }

  logout(){
    EasyLoading.show(status: "LogOut",dismissOnTap: false);
    AuthService.logout().then((value) => Get.offNamed(launcherPage));
  }

}