import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../auth/auth_service.dart';
import '../../utils/constants.dart';
import '../../utils/helper_functions.dart';


class LoginPageController extends GetxController{

  RxString errMsg = ''.obs;

  signInAuthenticate(String email, String pass, BuildContext context,
      GlobalKey<FormState> formKey) async {
    EasyLoading.show(status: 'Please Wait', dismissOnTap: false);
    if (formKey.currentState!.validate()) {
      try {
        final status = await AuthService.login(email, pass);
        print('from controller $status');
        if (status) {
          Get.offNamed(launcherPage);
          // Navigator.pushReplacementNamed(context, LauncherPage.routeName);
        } else {
          await AuthService.logout();
          EasyLoading.dismiss();
          errMsg.value = 'This email does not belong to an Admin account';
        }
      } on FirebaseAuthException catch (e) {
        errMsg.value = e.message!;
        showMsg(context, errMsg.toString(),primaryColorRed);
        EasyLoading.dismiss();
      }
    } else {
      EasyLoading.dismiss();
    }
  }

}