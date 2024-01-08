import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dashboard_page_item.dart';
import '../../widgets/dashboard_page_item_view.dart';
import '../../widgets/main_drawer.dart';
import 'dashboard_page_controller.dart';


class DashBoardPageView extends StatelessWidget {
  const DashBoardPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: const Center(child: Text('DashBoard')),
          // leading: Icon(Icons.menu),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Get.find<DashBoardPageController>().logout();
              },
            )
          ],
        ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 8,right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: dashboardItems.length,
        itemBuilder: (context, index) => DashboardPageItemView(
          item: dashboardItems[index],
          onPressed: (value) {
            final route = Get.find<DashBoardPageController>().navigate(value);
            Get.toNamed(route);
          },
        ),
      ));
  }

}
