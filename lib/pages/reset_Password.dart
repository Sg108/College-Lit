import 'package:flutter/material.dart';
import '../widgets/myTextfields.dart';
import '../widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reset extends StatelessWidget {
  Reset({super.key});
  static const routeName = '/reset';
  final emailController = TextEditingController();
  void reset_pass(BuildContext context) async {
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
          .sendPasswordResetEmail(email: emailController.text)
          .then((x) {
        Navigator.pop(context);
        Message("the mail has been sent to your registered E-mail", context);
      });
      // Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      //.pop(context);
      Navigator.of(context).pop();

      Message(e.code, context);
      //
    }
    //
  }

  void back(BuildContext context) {
    Navigator.of(context).pop();
  }

  void Message(String msg, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              msg,
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
                  const Text('Type in your registered email id',
                      style: TextStyle(
                          color: Color.fromARGB(255, 92, 91, 91),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  myTextField(emailController, 'email', false),
                  const SizedBox(height: 25),
                  MyButton(() => reset_pass(context), 'Send'),
                  const SizedBox(height: 15),
                  MySmallButton(() => back(context), 'Go back'),
                  const SizedBox(height: 25),
                ],
              ),
            )),
          ),
        ));
  }
}
