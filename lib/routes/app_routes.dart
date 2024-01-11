import 'package:get/get.dart';
import 'package:student_management/view/report_page/report_page_binding.dart';
import 'package:student_management/view/report_page/report_page_view.dart';
import 'package:student_management/view/settings_page/settings_page_binding.dart';
import 'package:student_management/view/settings_page/settings_page_view.dart';



import '../../utils/constants.dart';
import '../view/add_students_page/add_students_page_binding.dart';
import '../view/add_students_page/add_students_page_view.dart';
import '../view/classes/all_classes_bindings/all_classes_bindings.dart';
import '../view/classes/all_classes_view/class10_page_view.dart';
import '../view/classes/all_classes_view/class1_page_view.dart';
import '../view/classes/all_classes_view/class2_page_view.dart';
import '../view/classes/all_classes_view/class3_page_view.dart';
import '../view/classes/all_classes_view/class4_page_view.dart';
import '../view/classes/all_classes_view/class5_page_view.dart';
import '../view/classes/all_classes_view/class6_page__view.dart';
import '../view/classes/all_classes_view/class7_page_view.dart';
import '../view/classes/all_classes_view/class8_page_view.dart';
import '../view/classes/all_classes_view/class9_page_view.dart';
import '../view/classes/all_classes_view/class_kg_page_view.dart';
import '../view/classes/all_classes_view/class_nursery_page_view.dart';
import '../view/classes/all_classes_view/class_play_page_view.dart';
import '../view/dashboard_page/dashboard_page_binding.dart';
import '../view/dashboard_page/dashboard_page_view.dart';
import '../view/launcher_page/launcher_page_binding.dart';
import '../view/launcher_page/launcher_page_view.dart';
import '../view/login_page/login_page_binding.dart';
import '../view/login_page/login_page_view.dart';
import '../view/student_details_page/student_detailis_page_binding.dart';
import '../view/student_details_page/student_detailis_page_view.dart';
import '../view/view_students_page_page/view_students_page_binding.dart';
import '../view/view_students_page_page/view_students_page_view.dart';



class AppRoutes {
  static final pages = [
    GetPage(
      name: launcherPage,
      page: () => LauncherPageView(),
      binding: LauncherPageBinding()
    ),
    GetPage(
      name: loginPage,
      page: () => LoginPageView(),
      binding: LoginPageBinding()
    ),
    GetPage(
        name: dashBoardPage,
        page: () => DashBoardPageView(),
        binding: DashBoardPageBinding()
    ),
    GetPage(
        name: settingsPage,
        page: () => SettingPageView(),
        binding: SettingPageBinding()
    ),
    GetPage(
        name: addStudentsPage,
        page: () => AddStudentsPageView(),
        binding: AddStudentsPageBinding()
    ),
    GetPage(
        name: viewStudentsPage,
        page: () => ViewStudentsPageView(),
        binding: ViewStudentsPageBinding()
    ),
    GetPage(
        name: studentDetailsPage,
        page: () => StudentDetailsPageView(),
        binding: StudentDetailsPageBinding()
    ),
    GetPage(
        name: reportPage,
        page: () => ReportPageView(),
        binding: ReportPageBinding()
    ),




    GetPage(
        name: classPlayPage,
        page: () => ClassPlayPageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: classKgPage,
        page: () => ClassKgPageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: classNurseryPage,
        page: () => ClassNurseryPageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class1Page,
        page: () => Class1PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class2Page,
        page: () => Class2PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class3Page,
        page: () => Class3PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class4Page,
        page: () => Class4PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class5Page,
        page: () => Class5PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class6Page,
        page: () => Class6PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class7Page,
        page: () => Class7PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class8Page,
        page: () => Class8PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class9Page,
        page: () => Class9PageView(),
        binding: AllClassedBindings()
    ),
    GetPage(
        name: class10Page,
        page: () => Class10PageView(),
        binding: AllClassedBindings()
    ),

    // Add more routes here if needed
  ];
}
