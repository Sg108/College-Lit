import 'package:flutter/material.dart';
import '../widgets/myTextfields.dart';
import '../widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  final Function()? check;
  @override
  const login({super.key, this.check});
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void Signin() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((x) => {Navigator.pop(context)});
      // Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      //.pop(context);
      Navigator.of(context).pop();

      wrongMessage(e.code);
      //
    }
    //
  }

  void wrongMessage(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              error,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 6, 215, 243),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Icon(Icons.login, size: 100),
                  const SizedBox(height: 50),
                  const Text('Welcome back to College Bytes!',
                      style: TextStyle(
                          color: Color.fromARGB(255, 92, 91, 91),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  myTextField(emailController, 'email', false),
                  const SizedBox(height: 15),
                  myTextField(passwordController, 'password', true),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?',
                            style: TextStyle(
                              color: Color.fromARGB(255, 92, 91, 91),
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyButton(Signin, 'Sign In'),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member? ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 92, 91, 91),
                              fontSize: 18,
                            )),
                        GestureDetector(
                          onTap: widget.check,
                          child: const Text('Register Now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 4, 2, 98),
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
