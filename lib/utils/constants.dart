
import 'package:flutter/material.dart';

const String currencySymbol = '৳';

const String launcherPage = '/';
const String loginPage = '/login';
const String dashBoardPage = '/dashboard';
const String settingsPage = '/settings';
const String addStudentsPage = '/add_students';
const String viewStudentsPage = '/view_students';
const String studentDetailsPage = '/student_details_page';


const String classPlayPage = '/class_play';
const String classKgPage = '/class_kg';
const String classNurseryPage = '/class_nursery';
const String class1Page = '/class1';
const String class2Page = '/class2';
const String class3Page = '/class3';
const String class4Page = '/class4';
const String class5Page = '/class5';
const String class6Page = '/class6';
const String class7Page = '/class7';
const String class8Page = '/class8';
const String class9Page = '/class9';
const String class10Page = '/class10';


const Color primaryColorGreen = Color(0xff79ff00);
const Color primaryColorRed = Color(0xffff0000);
const Color primaryColorWhite = Color(0xfff7fcfc);
const Color primaryColorTitle = Color(0xfff16161);
const Color backgroundColorBlue = Color(0xff172d36);
const Color blueColor1 = Color(0xff1e3e54);
const Color whiteColor1 = Color(0xffffffff);


ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColorBlue,
  appBarTheme: AppBarTheme(backgroundColor: backgroundColorBlue),
  drawerTheme:
  DrawerThemeData(backgroundColor: backgroundColorBlue),
  backgroundColor: primaryColorWhite,
  primaryColor: blueColor1,
  cardColor: whiteColor1
);

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primaryColorWhite,
    appBarTheme: AppBarTheme(backgroundColor: primaryColorWhite),
    drawerTheme:
    DrawerThemeData(backgroundColor: primaryColorWhite),
    backgroundColor: primaryColorWhite,
    primaryColor: whiteColor1,
    cardColor: blueColor1
);