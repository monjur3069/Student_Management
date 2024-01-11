import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management/view/student_details_page/student_detailis_page_controller.dart';

import '../../utils/constants.dart';
import '../../widgets/student_details_page_appbar_action.dart';
import '../../widgets/student_details_page_item.dart';


class StudentDetailsPageView extends StatelessWidget {

  StudentDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var studentModel = Get.arguments;
    final controller =
    Get.find<StudentDetailsPageController>();
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: theme.cardColor),
        title: Center(child: Text('Student Details Page',style: TextStyle(
          color: theme.cardColor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),)),
        actions: [
          StudentDetailsPageAppbarAction(controller: controller, studentModel: studentModel)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                      child: Text(
                        studentModel.studentName,
                        style: TextStyle(
                          color: theme.cardColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                ),
                Card(
                  color: theme.cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: theme.cardColor,width: .5)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/spinner.gif',
                      image: studentModel.imageUrl,
                      height: 120,
                      width: 120,
                      fadeInDuration: const Duration(seconds: 2),
                      fadeInCurve: Curves.bounceInOut,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: theme.cardColor,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: theme.cardColor,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Text(
                              'Student Information',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        Divider(height: 1, color: theme.primaryColor),
                        SizedBox(
                          height: 10,
                        ),
                        StudentDetailsPageItem(
                            title: 'Class'.tr,
                            subTitle: studentModel.className),
                        StudentDetailsPageItem(
                            title: 'Roll'.tr,
                            subTitle: studentModel.rollNo.toString()),
                        StudentDetailsPageItem(
                            title: 'Father Name'.tr,
                            subTitle: studentModel.fatherName),
                        StudentDetailsPageItem(
                            title: 'Mother Name'.tr,
                            subTitle: studentModel.motherName),
                        StudentDetailsPageItem(
                            title: 'Address'.tr,
                            subTitle: studentModel.address),
                        StudentDetailsPageItem(
                            title: 'Phone'.tr,
                            subTitle: studentModel.phoneNumber),
                        StudentDetailsPageItem(
                            title: 'Session'.tr,
                            subTitle: studentModel.session.toString()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Date Of Birth'.tr,
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${studentModel.dateModel.day.toString()}/${studentModel.dateModel.month.toString()}/${studentModel.dateModel.year.toString()}',
                              style: TextStyle(
                                color: theme.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
