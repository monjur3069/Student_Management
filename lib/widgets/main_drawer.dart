import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/utils/constants.dart';

import '../view/dashboard_page/dashboard_page_controller.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * .7,
      child: ListView(
        children: [
          Container(
            height: 150,
            color: theme.primaryColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'images/logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Kaundia Madrasha',
                  style: TextStyle(color: theme.cardColor,fontSize: 14,
                    fontWeight: FontWeight.w400,),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('v 0.0.0',
                    style: TextStyle(color: theme.cardColor,fontSize: 12,
                      fontWeight: FontWeight.w400,),),
              ],
            ),
          ),
          ListTile(
            onTap: () {
            },
            leading: Icon(
              Icons.person,
              color: theme.cardColor,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(color: theme.cardColor,fontSize: 16,
                fontWeight: FontWeight.w600,),
            ),
          ),
          ListTile(
            onTap: () {
              Get.toNamed(settingsPage);
            },
            leading: Icon(
              Icons.settings,
              color: theme.cardColor,
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: theme.cardColor,fontSize: 16,
                fontWeight: FontWeight.w600,),
            ),
          ),
          ListTile(
            onTap: () {
              Get.find<DashBoardPageController>().logout();
            },
            leading: Icon(
              Icons.logout,
              color: theme.cardColor,
            ),
            title: Text(
              'LOGOUT',
              style: TextStyle(color: theme.cardColor,fontSize: 16,
                fontWeight: FontWeight.w600,),
            ),
          ),
        ],
      ),
    );
  }
}
