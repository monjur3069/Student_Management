import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../../db/db_helper.dart';
import '../../models/date_model.dart';
import '../../models/student_model.dart';
import '../../utils/constants.dart';
import '../../utils/helper_functions.dart';

class AddStudentsPageController extends GetxController{

  final rollNoController = TextEditingController();
  final studentNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final motherNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final sessionController = TextEditingController();

  RxString dropdownValue = 'Play'.obs;
  DateTime? addDate;
  String? imageUrl;
  RxBool isUploading = false.obs;
  ImageSource imageSource = ImageSource.camera;

  @override
  void dispose() {
    rollNoController.dispose();
    studentNameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    addressController.dispose();
    sessionController.dispose();
    super.dispose();
  }

  setValue(String? newValue) {
    dropdownValue.value = newValue!;
  }

  selectDate(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      addDate = selectedDate;
      update();
    }
  }

  getImage() async {
    if(imageUrl != null){
      await DBHelper.deleteFileFromFirebaseStorage(imageUrl!.toString());
      imageUrl = null;
      update();
      print(imageUrl);
    }
    final selecteImage =
    await ImagePicker().pickImage(source: imageSource, imageQuality: 25);
    if (selecteImage != null) {
      isUploading.value = true;
      try {
        final url = await updateImage(selecteImage);
        imageUrl = url;
        update();
        isUploading.value = false;
      } catch (e) {}
    }
  }

  Future<String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final photoRef =
    FirebaseStorage.instance.ref().child('Pictures/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }

  saveInfo(
      BuildContext context,
      GlobalKey<FormState> formKey) async {
    {

      if (imageUrl == null) {
        showMsg(context, 'Image is required ', primaryColorRed);
        return;
      }
      if (addDate == null) {
        showMsg(context, 'Date is required', primaryColorRed);
        return;
      }
      if (formKey.currentState!.validate() && imageUrl != null && addDate != null) {
        final studentModel = StudentModel(
            studentName: studentNameController.text,
            fatherName: fatherNameController.text,
            motherName: motherNameController.text,
            phoneNumber: phoneNumberController.text,
            imageUrl: imageUrl!,
            dateModel: DateModel(
              timestamp: Timestamp.fromDate(addDate!),
              day: addDate!.day,
              month: addDate!.month,
              year: addDate!.year,
            ),
            address: addressController.text,
            className: dropdownValue.toLowerCase(),
            rollNo: num.parse(rollNoController.text),
            session: num.parse(sessionController.text));
        return studentModel;
      }
    }
  }

  Future<void> addStudent(StudentModel studentModel) {
    EasyLoading.show(
      status: 'Please Wait',
      dismissOnTap: false,
    );
    dropdownValue.value = 'Play';
    studentNameController.clear();
    fatherNameController.clear();
    motherNameController.clear();
    phoneNumberController.clear();
    addressController.clear();
    rollNoController.clear();
    sessionController.clear();
    imageUrl = null;
    addDate = null;
    update();
    return DBHelper.addStudent(studentModel);
  }

}