
import 'date_model.dart';

const String tableColClassName = 'class_name';
const String tableColRollNo = 'roll_no';
const String tableColStudentName = 'student_name';
const String tableColFatherName = 'father_name';
const String tableColMotherName = 'mother_name';
const String tableColPhoneNumber = 'phone_number';
const String tableColImageUrl = 'imageUrl';
const String tableColDate = 'date';
const String tableColAddress = 'address';
const String tableColSession = 'session';

class StudentModel {
  String studentName, fatherName, motherName, address, className, imageUrl, phoneNumber;
  num rollNo, session;
  DateModel dateModel;

  StudentModel(
      {required this.studentName,
      required this.fatherName,
      required this.motherName,
      required this.phoneNumber,
      required this.imageUrl,
      required this.dateModel,
      required this.address,
      required this.className,
      required this.rollNo,
      required this.session})
      : assert(rollNo > 0);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      tableColClassName: className,
      tableColRollNo: rollNo,
      tableColStudentName: studentName,
      tableColFatherName: fatherName,
      tableColMotherName: motherName,
      tableColPhoneNumber: phoneNumber,
      tableColImageUrl: imageUrl,
      tableColDate : dateModel.toMap(),
      tableColAddress: address,
      tableColSession: session,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      className: map[tableColClassName],
      rollNo: map[tableColRollNo],
      studentName: map[tableColStudentName],
      fatherName: map[tableColFatherName],
      motherName: map[tableColMotherName],
      phoneNumber: map[tableColPhoneNumber] ?? 'N/A',
      imageUrl: map[tableColImageUrl],
      dateModel: DateModel.fromMap(map[tableColDate]),
      address: map[tableColAddress],
      session: map[tableColSession],
    );
  }

}
