import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/view/view_students_page_page/view_students_page_controller.dart';

import '../../utils/view_page_item.dart';
import '../../widgets/view_page_item_view.dart';

class ViewStudentsPageView extends StatelessWidget {
  const ViewStudentsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.cardColor),
        title: Center(
            child: Text(
          'All Classes'.tr,
          style: TextStyle(
            color: theme.cardColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 8, right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: viewItems.length,
        itemBuilder: (context, index) => ViewPageItemView(
          item: viewItems[index],
          onPressed: (value) {
            final route =
                Get.find<ViewStudentsPageController>().navigate(value);
            Get.toNamed(route);
          },
        ),
      ),
    );
  }
}
