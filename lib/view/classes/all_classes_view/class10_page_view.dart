import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all_classes_controller/all_classes_controller.dart';
import '../../../widgets/class_page_item_view.dart';
import '../../../widgets/every_class_appbar.dart';

class Class10PageView extends StatelessWidget {
  static const String routeName = '/class10_page';

  const Class10PageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AllClassesController>();
    return Scaffold(
      appBar: EveryClassAppbar(className: '10'),
      body: GetBuilder<AllClassesController>(
          init: controller.getAllStudentByClassName('10'),
          builder: (context) {
            return ClassPageItemView(controller: controller);
          }),
    );
  }
}
