import 'dart:ui';

import 'package:get/get.dart';
import 'package:student_management/auth/auth_prefs.dart';
import '../../utils/constants.dart';

class SettingPageController extends GetxController{
  RxBool valueForTheme = true.obs;
  RxBool valueForLanguage = false.obs;

  changeTheme(bool _value){
    valueForTheme.value ? Get.changeTheme(darkTheme) : Get.changeTheme(lightTheme);
    valueForTheme.value = _value;
    setValueForTheme(valueForTheme.value);
    print('After set the value $valueForTheme');
  }

  changeLanguage(String langCode, String countryCode, bool bool){
    var locale = Locale(langCode,countryCode);
    valueForLanguage.value = bool;
    setValueForLanguage(valueForLanguage.value);
    Get.updateLocale(locale);
  }

  valueInitialization() async {
    valueForTheme.value = await getValueForTheme();
    valueForLanguage.value = await getValueForLanguage();
    print('Initial value from Setting Page Controller $valueForTheme');
  }

  @override
  void onInit() {
    valueInitialization();
    super.onInit();
  }
}