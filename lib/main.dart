import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import '../pages/isauth.dart';

import './screens/attendence_screen.dart';
import './screens/timetable_screen.dart';
import './screens/update_profile_screen.dart';
import './screens/registration_screen.dart';
import './screens/examination_details_screen.dart';
import 'package:provider/provider.dart';
import './models/student_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Student())],
      child: MaterialApp(
        title: 'College Bytes',
        home: IsAuth(),
        initialRoute: '/',
        routes: {
          ExaminationDetailsScreen.routeName: (_) => ExaminationDetailsScreen(),
          RegistrationScreen.routeName: (_) => RegistrationScreen(),
          UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
          AttendenceScreen.routeName: (_) => AttendenceScreen(),
          TimeTableScreen.routeName: (_) => TimeTableScreen(),
        },
      ),
    );
  }
}



//import './widgets/dashboard.dart';



// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: MainDrawer(),
//       appBar: AppBar(title: Text('College Bytes')),
//       body: Container(
//         child: DynamicEvent(),
//       ),
//     );
//   }
// }