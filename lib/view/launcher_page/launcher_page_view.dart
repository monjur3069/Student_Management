import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'launcher_page_controller.dart';

class LauncherPageView extends StatelessWidget {
  const LauncherPageView({super.key});

  @override
  Widget build(BuildContext context) {
    LauncherPageController launcherController = Get.find<LauncherPageController>();
    return Scaffold(
        body: /*GetBuilder<LauncherPageController>(
            init: LauncherPageController(),
            builder: (context) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        )*/Center(
          child: CircularProgressIndicator(),
        ));
  }
}

