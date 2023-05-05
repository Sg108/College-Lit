import 'package:college_bytes/widgets/current_attendance.dart';

import '/constants.dart';
import '/widgets/recent_alerts.dart';

import '../models/student_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});
  static const routeName = '/attendence';
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Header(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
              child: Text(
            'Hi ${Provider.of<Student>(context).name}',
            style: TextStyle(color: Colors.white, fontSize: 22),
          )),
        ),
        SizedBox(height: 30.0),
        Container(
          padding: EdgeInsets.all(35.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'View Attendance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              CurrentAttendance(),
            ],
          ),
        ),
      ],
    );
  }
}
