import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/class_page_item_view.dart';
import '../../../widgets/every_class_appbar.dart';

import '../all_classes_controller/all_classes_controller.dart';

class Class1PageView extends StatelessWidget {
  const Class1PageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllClassesController>();
    return Scaffold(
      appBar: EveryClassAppbar(className: '1'),
      body: GetBuilder<AllClassesController>(
          init: controller.getAllStudentByClassName('1'),
          builder: (context) {
            return ClassPageItemView(controller: controller);
          }),
    );
  }
}
