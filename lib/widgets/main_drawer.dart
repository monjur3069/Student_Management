import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/dashboard_page/dashboard_page_controller.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            color: Theme.of(context).primaryColor,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_cart),
            title: const Text('My Cart'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.shopping_bag),
            title: const Text('My Orders'),
          ),
          ListTile(
            onTap: () {
              //Navigator.pushNamed(context, UserProfilePage.routeName);
            },
            leading: Icon(Icons.person),
            title: const Text('My Profile'),
          ),
          ListTile(
            onTap: () {
              Get.find<DashBoardPageController>().logout();
            },
            leading: const Icon(Icons.logout),
            title: const Text('LOGOUT'),
          ),
        ],
      ),
    );
  }
}
