import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/utils/constants.dart';
import 'package:student_management/view/settings_page/settings_page_controller.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var controller = Get.find<SettingPageController>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.cardColor),
        title: Center(
            child: Text(
          'Settings',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: theme.cardColor),
        )),
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 16, left: 16),
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change Theme'.tr,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: theme.cardColor),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                        activeColor: theme.cardColor,
                        inactiveThumbColor: theme.cardColor,
                        activeTrackColor: theme.cardColor.withOpacity(0.5),
                        inactiveTrackColor: theme.primaryColor.withOpacity(0.5),
                        value: controller.valueForTheme.value,
                        onChanged: (value) => controller.changeTheme(value)),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Change Language'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: theme.cardColor),
                ),
              ),
              ElevatedButton(
                  onPressed: () => controller.changeLanguage('bn', 'BD', true),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          controller.valueForLanguage.value
                              ? primaryColorGreen
                              : theme.cardColor)),
                  child: Text(
                    'Bangla',
                    style: TextStyle(
                        color: controller.valueForLanguage.value
                            ? primaryColorWhite
                            : theme.primaryColor),
                  )),
              SizedBox(width: 5,),
              ElevatedButton(
                  onPressed: () => controller.changeLanguage('en', 'US', false),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          !controller.valueForLanguage.value
                              ? primaryColorGreen
                              : theme.cardColor)),
                  child: Text(
                    'English',
                    style: TextStyle(
                        color: !controller.valueForLanguage.value
                            ? primaryColorWhite
                            : theme.primaryColor),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
