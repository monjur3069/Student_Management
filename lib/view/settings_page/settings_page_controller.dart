import 'dart:ui';

import 'package:get/get.dart';
import '../../utils/constants.dart';

class SettingPageController extends GetxController{
  RxBool valueForTheme = true.obs;
  RxBool valueForLanguage = false.obs;
  changeTheme(bool _value){
    valueForTheme.value ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme);
    valueForTheme.value = _value;
  }
  changeLanguage(String langCode, String countryCode, bool bool){
    var locale = Locale(langCode,countryCode);
    valueForLanguage.value = bool;
    Get.updateLocale(locale);
  }
}