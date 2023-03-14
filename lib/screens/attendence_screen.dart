import 'package:flutter/material.dart';

class AttendenceScreen extends StatelessWidget {
  const AttendenceScreen({super.key});
  static const routeName = '/attendence';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Attendence'),
      ),
    );
  }
}
