import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/class_page_item_view.dart';
import '../../../widgets/every_class_appbar.dart';

import '../all_classes_controller/all_classes_controller.dart';

class Class5PageView extends StatelessWidget {
  static const String routeName = '/class5_page';

  const Class5PageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllClassesController>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: EveryClassAppbar(className: '5'),
      body: GetBuilder<AllClassesController>(
          init: controller.getAllStudentByClassName('5'),
          builder: (context) {
            return ClassPageItemView(controller: controller);
          }),
    );
  }
}
