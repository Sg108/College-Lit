import 'package:flutter/material.dart';

import './widgets/MainDrawer.dart';

import './screens/attendence_screen.dart';
import './screens/timetable_screen.dart';
import './screens/update_profile_screen.dart';
import './screens/registration_screen.dart';
import './screens/examination_details_screen.dart';
import './widgets/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Bytes',
      home: MyPage(),
      initialRoute: '/',
      routes: {
        ExaminationDetailsScreen.routeName: (_) => ExaminationDetailsScreen(),
        RegistrationScreen.routeName: (_) => RegistrationScreen(),
        UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
        AttendenceScreen.routeName: (_) => AttendenceScreen(),
        TimeTableScreen.routeName: (_) => TimeTableScreen(),
      },
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('College Bytes')),
      body: Container(
        child: DynamicEvent(),
      ),
    );
  }
}
