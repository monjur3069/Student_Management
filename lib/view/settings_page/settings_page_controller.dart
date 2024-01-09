import 'package:get/get.dart';

import '../../utils/constants.dart';

class SettingPageController extends GetxController{
  RxBool value = true.obs;
  changeTheme(bool _value){
    value.value ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme);
    value.value = _value;
  }
}