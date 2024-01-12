import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_management/routes/app_routes.dart';
import 'package:student_management/utils/constants.dart';

import 'auth/auth_prefs.dart';
import 'firebase_options.dart';
import 'services/localiztion_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var valueForTheme = await getValueForTheme();
  var valueForLanguage = await getValueForLanguage();
  runApp(MyApp(valueForTheme:valueForTheme,valueForLanguage: valueForLanguage,));

}

class MyApp extends StatelessWidget {
  bool valueForTheme;
  bool valueForLanguage;
  MyApp({required this.valueForTheme,required this.valueForLanguage,super.key});

  @override
  Widget build(BuildContext context) {
    print('The Initial value is $valueForTheme');
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => SafeArea(
        child: GetMaterialApp(
          translations: Localization(),
          locale: valueForLanguage ? Locale('bn','bd') : Get.deviceLocale,
          fallbackLocale: const Locale('bn','bd'),//Get.deviceLocale,
          debugShowCheckedModeBanner: false,
          title: 'KPCAM',
          theme: valueForTheme ? lightTheme : darkTheme,
          builder: EasyLoading.init(),
          getPages: AppRoutes.pages,
          initialRoute: launcherPage,
        ),
      ),
    );
  }
}
