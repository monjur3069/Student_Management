import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_classes_controller/all_classes_controller.dart';
import '../../../widgets/class_page_item_view.dart';
import '../../../widgets/every_class_appbar.dart';

class ClassKgPageView extends StatelessWidget {
  const ClassKgPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllClassesController>();
    return Scaffold(
      appBar: EveryClassAppbar(className: 'Kg'),
      body: GetBuilder<AllClassesController>(
          init: controller.getAllStudentByClassName('kg'),
          builder: (context) {
            return ClassPageItemView(controller: controller);
          }),
    );
  }
}
