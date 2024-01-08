import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';


import '../../utils/class_name_items.dart';
import '../../utils/constants.dart';
import '../../utils/helper_functions.dart';
import 'add_students_page_controller.dart';

class AddStudentsPageView extends StatelessWidget {
  const AddStudentsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AddStudentsPageController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Student Management'),
          actions: [
            IconButton(
                onPressed: () async {
                  final studentModel =
                      await controller.saveInfo(context, formKey);
                  await controller.addStudent(studentModel);
                  showMsg(
                      context,
                      'Student Information added added successfully',
                      primaryColorGreen);
                  EasyLoading.dismiss();
                },
                icon: Icon(Icons.save_alt))
          ],
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 10, left: 5, right: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Class'),
                      Obx(
                        () => DropdownButton(
                          value: controller.dropdownValue.value,
                          focusColor: primaryColorWhite,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: classNameItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            controller.setValue(newValue);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.rollNoController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Roll No',
                    labelText: 'Roll No',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else if (int.parse(value) < 1) {
                      return 'Please Enter above 0';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.studentNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Student Name',
                    labelText: 'Student Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.fatherNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Father Name',
                    labelText: 'Father Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.motherNameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Mother Name',
                    labelText: 'Mother Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.addressController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Address',
                    labelText: 'Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  controller: controller.sessionController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Session',
                    labelText: 'Session',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field must not be empty';
                    } else if (int.parse(value) <= 2000) {
                      return 'Please Enter above 2000';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () async {
                            await controller.selectDate(context);
                          },
                          child: Text('Select Add Date')),
                      GetBuilder<AddStudentsPageController>(
                          init: controller,
                          builder: (context) {
                            return Text(controller.addDate == null
                                ? 'No Date Chosen'
                                : getFormattedDateTime(
                                    controller.addDate!, 'dd/MM/yyyy'));
                          }),
                    ],
                  ),
                ), //date of birth
                Center(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: GetBuilder<AddStudentsPageController>(
                          init: controller,
                          builder: (context) {
                            return ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: controller.imageUrl == null
                                    ? Obx(
                                        () {
                                          return controller.isUploading.value
                                              ? Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : Image.asset(
                                                  'images/placeholder.jpg',
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 100,
                                                );
                                        },
                                      )
                                    : Obx(
                                        () => FadeInImage.assetNetwork(
                                          placeholder: 'images/spinner.gif',
                                          image: controller.imageUrl!,
                                          height: 100,
                                          width: 100,
                                          fadeInDuration:
                                              const Duration(seconds: 2),
                                          fadeInCurve: Curves.bounceInOut,
                                          fit: BoxFit.cover,
                                        ),
                                      ));
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          controller.imageSource = ImageSource.camera;
                          await controller.getImage();
                        },
                        child: Text('Camera')),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          controller.imageSource = ImageSource.gallery;
                          await controller.getImage();
                          // await controller.getImagewithImage();
                        },
                        child: Text('Gallary')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
