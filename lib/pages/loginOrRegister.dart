import './login.dart';
import './register.dart';

import 'package:flutter/material.dart';

class loginOrResgister extends StatefulWidget {
  const loginOrResgister({super.key});

  @override
  State<loginOrResgister> createState() => _loginOrResgisterState();
}

class _loginOrResgisterState extends State<loginOrResgister> {
  bool isLogin = true;
  void check() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? login(check: check) : register(check: check);
  }
}
