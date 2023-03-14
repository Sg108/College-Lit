import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  final int id;
  final String name;
  final String email;
  final String pic_url;
  static const routeName = '/student-profile';
  StudentProfileScreen(
      {required this.id,
      required this.name,
      required this.email,
      required this.pic_url});
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
