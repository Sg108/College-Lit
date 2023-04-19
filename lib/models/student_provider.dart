import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

class Student extends ChangeNotifier {
  String id = "";
  String name = "newUser";
  String batch = "";
  String email = "abc@email.com";
  String pic =
      'https://steamuserimages-a.akamaihd.net/ugc/1658975992873119928/D51F3889E81F40389CD31A9D14CCB0E75431EC3D/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false';
  String enroll = "";
  String semester = "";

  void initiate(uid, mail) {
    id = uid;
    email = mail;
    notifyListeners();
  }

  void setData(name, email, batch, enroll, semester) {
    this.name = name;
    this.email = email;
    this.enroll = enroll;
    this.semester = semester;
    this.batch = batch;
    notifyListeners();
  }

  void getPic(pic) {
    this.pic = pic;
    notifyListeners();
  }
  // Student(
  //     {required this.id,
  //     required this.name,
  //     required this.batch,
  //     required this.email,
  //     required this.picture});
}
