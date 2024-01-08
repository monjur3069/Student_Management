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
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: const Center(child: Text('Student Details Page',style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: primaryColorTitle),)),
        actions: [
          /*PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Update'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Delete'),
              ),
              // Add more options as needed
            ],
            onSelected: (value) {
              // Handle the selected option
              switch (value) {
                case 1:
                  // Handle Option 2
                  break;
                case 2:
                  provider.deleteStudentByRollNo(context, studentModel.rollNo,
                      studentModel.imageUrl, true);
                  break;
                // Add more cases as needed
              }
            },
          ),*/
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
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: primaryColorTitle),
                      )),
                ),
                Card(
                  elevation: 10,
                  shadowColor: primaryColorTitle,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: primaryColorTitle)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
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
                shadowColor: primaryColorTitle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: primaryColorWhite,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primaryColorWhite,
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: primaryColorTitle),
                            )),
                        Divider(height: 1, color: primaryColorTitle),
                        SizedBox(
                          height: 10,
                        ),
                        StudentDetailsPageItem(
                            title: 'Class : ',
                            subTitle: studentModel.className),
                        StudentDetailsPageItem(
                            title: 'Roll No : ',
                            subTitle: studentModel.rollNo.toString()),
                        StudentDetailsPageItem(
                            title: 'Father Name : ',
                            subTitle: studentModel.fatherName),
                        StudentDetailsPageItem(
                            title: 'Mother Name : ',
                            subTitle: studentModel.motherName),
                        StudentDetailsPageItem(
                            title: 'Address : ',
                            subTitle: studentModel.address),
                        StudentDetailsPageItem(
                            title: 'Phone : ',
                            subTitle: studentModel.phoneNumber),
                        StudentDetailsPageItem(
                            title: 'Session : ',
                            subTitle: studentModel.session.toString()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Date Of Birth : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: primaryColorTitle),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${studentModel.dateModel.day.toString()}/${studentModel.dateModel.month.toString()}/${studentModel.dateModel.year.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
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
