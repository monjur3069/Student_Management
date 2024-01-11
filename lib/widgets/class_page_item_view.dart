import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/constants.dart';
import '../view/classes/all_classes_controller/all_classes_controller.dart';

class ClassPageItemView extends StatelessWidget {
  AllClassesController controller;
  ClassPageItemView({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return controller.studentList.isEmpty
        ? Center(
            child: Text(
              'No item found',
              style: TextStyle(
                color: theme.cardColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        : ListView.builder(
            padding: EdgeInsets.only(left: 8, right: 8),
            itemCount: controller.studentList.length,
            itemBuilder: (context, index) {
              controller.studentList
                  .sort((a, b) => a.rollNo.compareTo(b.rollNo));
              final student = controller.studentList[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async =>
                    await deleteConfirmationDialogue(context),
                onDismissed: (_) {
                  controller.deleteStudentByRollNo(
                      student.rollNo, student.imageUrl, false);
                },
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                  ),
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.delete,
                    size: 35,
                    color: primaryColorWhite,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(studentDetailsPage, arguments: student);
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: theme.cardColor,
                    child: Container(
                      padding: EdgeInsets.only(left: 12, right: 8, top: 10),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: theme.cardColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Text(
                            student.studentName,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: theme.primaryColor),
                          )),
                          Divider(height: 1, color: theme.primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Class'.tr,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: theme.primaryColor),
                                      ),
                                      Text(
                                        ' : ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: theme.primaryColor),
                                      ),
                                      Text(
                                        student.className,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: theme.primaryColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Roll'.tr,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: theme.primaryColor),
                                      ),
                                      Text(
                                        ' : ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: theme.primaryColor),
                                      ),
                                      Text(
                                        student.rollNo.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: theme.primaryColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await _call((student.phoneNumber));
                                      },
                                      icon: Icon(Icons.call,
                                          color: theme.primaryColor)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }

  Future<bool?> deleteConfirmationDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Delete'),
              content: Text('Sure to delete this Student'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('CANCEL')),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('YES')),
              ],
            ));
  }

  _call(String phoneNumber) async {
    final uri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch URL';
    }
  }
}
