import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import '../pages/isauth.dart';

import 'package:college_bytes/pages/reset_Password.dart';
import 'screens/attendance_screen.dart';
import './screens/timetable_screen.dart';
import './screens/update_profile_screen.dart';
import './screens/registration_screen.dart';
import './screens/examination_details_screen.dart';
import './screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import './models/student_provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import './screens/courses_recommended_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'important_notifications',
        channelName: 'notifications_channel',
        channelDescription: 'notification channel for classes and events',
      ),
    ],
    debug: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Student())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'College Bytes',
        theme: ThemeData(
          // primarySwatch: Color(0xFF202328),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          iconTheme: IconThemeData(color: Color(0xFF63CF93)),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Color(0xFF202328),
                secondary: Color(0xFF63CF93),
                background: Color(0xFF12171D),
              ),
        ),
        home: WelcomeScreen(),
        initialRoute: '/',
        routes: {
          ExaminationDetailsScreen.routeName: (_) => ExaminationDetailsScreen(),
          RegistrationScreen.routeName: (_) => RegistrationScreen(),
          UpdateProfileScreen.routeName: (_) => UpdateProfileScreen(),
          AttendanceScreen.routeName: (_) => AttendanceScreen(),
          TimeTableScreen.routeName: (_) => TimeTableScreen(),
          Reset.routeName: (_) => Reset(),
          //RecommendedScreen.routeName: (_) => RecommendedScreen(),
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