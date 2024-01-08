import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPageItem {
  IconData icon;
  String title;

  DashboardPageItem({
    required this.icon,
    required this.title,
  });

  static const String addStudents = 'Add Students';
  static const String viewStudents = 'View Students';
  static const String payTuitionFees = 'Pay Tuition Fees';
  static const String user = 'Users';
  static const String settings = 'Settings';
  static const String report = 'Report';
}

final List<DashboardPageItem> dashboardItems = [
  DashboardPageItem(icon: Icons.group_add, title: DashboardPageItem.addStudents,),
  DashboardPageItem(icon: Icons.people, title: DashboardPageItem.viewStudents,),
  DashboardPageItem(icon: Icons.monetization_on, title: DashboardPageItem.payTuitionFees,),
  DashboardPageItem(icon: Icons.person, title: DashboardPageItem.user,),
  DashboardPageItem(icon: Icons.settings, title: DashboardPageItem.settings,),
  DashboardPageItem(icon: Icons.area_chart, title: DashboardPageItem.report,),
];

