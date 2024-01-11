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
    var theme = Theme.of(context);
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.cardColor),
          title: Center(
              child: Text(
            'DashBoard'.tr,
            style: TextStyle(color: theme.cardColor,fontSize: 16,
              fontWeight: FontWeight.w600,),
          )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                  onPressed: () async {
                    Get.find<DashBoardPageController>().logout();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(theme.cardColor)),
                  child: Text(
                    'Log Out'.tr,
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  )),
            )
          ],
        ),
        body: GridView.builder(
          padding: const EdgeInsets.only(left: 8, right: 8),
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
