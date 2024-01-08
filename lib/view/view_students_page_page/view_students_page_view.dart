import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/view/view_students_page_page/view_students_page_controller.dart';

import '../../utils/view_page_item.dart';
import '../../widgets/view_page_item_view.dart';


class ViewStudentsPageView extends StatelessWidget {
  const ViewStudentsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('All Classes')),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 8,right: 8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemCount: viewItems.length,
        itemBuilder: (context, index) => ViewPageItemView(
          item: viewItems[index],
          onPressed: (value) {
            final route = Get.find<ViewStudentsPageController>().navigate(value);
            Get.toNamed(route);
          },
        ),
      ),
      /*Center(
          child: SingleChildScrollView(
        child: Wrap(
          runSpacing: 15,
          spacing: 15,
          children: [
            ViewPageItemView(
              item: viewItems[0],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[1],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[2],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[3],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[4],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[5],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[6],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[7],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[8],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[9],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[10],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[11],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),
            ViewPageItemView(
              item: viewItems[12],
              onPressed: (value) {
                final route = navigate(value);
                if(route != ''){
                  Navigator.pushNamed(context, route);
                }
              },
            ),


          ],
        ),
      ))*/
    );
  }

}
