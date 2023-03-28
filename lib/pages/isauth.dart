import 'package:college_bytes/pages/loginOrRegister.dart';
import 'package:flutter/material.dart';
import '../pages/loginOrRegister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/dashboard.dart';

class IsAuth extends StatelessWidget {
  const IsAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return dashboard(snapshot.data?.uid);
        } else {
          return loginOrResgister();
        }
      },
    ));
  }
}
