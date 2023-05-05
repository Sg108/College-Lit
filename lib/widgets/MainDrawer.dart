import 'package:college_bytes/models/student_provider.dart';
import 'package:college_bytes/screens/examination_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/attendance_screen.dart';
import '../screens/timetable_screen.dart';
import '../screens/update_profile_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/examination_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer();
  void tapHandler(BuildContext context, String route_path) {
    Navigator.of(context).pushNamed(route_path);
  }

  //final String username = 'Shivam Gupta';

  final String pic_url =
      'https://steamuserimages-a.akamaihd.net/ugc/1658975992873119928/D51F3889E81F40389CD31A9D14CCB0E75431EC3D/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false';
  Widget buildListTile(
      String title, IconData icon, String route_path, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onTap: () {
          tapHandler(context, route_path);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Color.fromRGBO(50, 75, 205, 1),
      child: Column(
        children: <Widget>[
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(Provider.of<Student>(context).pic),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      const SizedBox(height: 12),
                      Text(Provider.of<Student>(context).name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                      const SizedBox(height: 8),
                      Text(Provider.of<Student>(context).email,
                          style: const TextStyle(
                            color: Colors.white70,
                          )),
                    ],
                  )
                ],
              )),
          const SizedBox(height: 20),
          buildListTile('Update Profile', Icons.person,
              UpdateProfileScreen.routeName, context),
          buildListTile(
              'Attendence', Icons.percent, AttendanceScreen.routeName, context),
          buildListTile(
              'Time Table', Icons.schedule, TimeTableScreen.routeName, context),
          buildListTile('Examination Details', Icons.school,
              ExaminationDetailsScreen.routeName, context),
          buildListTile('Registration', Icons.app_registration,
              RegistrationScreen.routeName, context),
          const SizedBox(height: 20),
          Divider(color: Colors.white70),

          // buildListTile('Logout', Icons.login, '/', context),
        ],
      ),
    ));
  }
}
