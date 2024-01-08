import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_classes_controller/all_classes_controller.dart';
import '../../../widgets/class_page_item_view.dart';
import '../../../widgets/every_class_appbar.dart';

class Class9PageView extends StatelessWidget {
  static const String routeName = '/class9_page';

  const Class9PageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllClassesController>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: EveryClassAppbar(className: 'Play'),
      body: GetBuilder<AllClassesController>(
          init: controller.getAllStudentByClassName('play'),
          builder: (context) {
            return ClassPageItemView(controller: controller);
          }),
    );
  }
}