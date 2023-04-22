import '../widgets/myTextfields.dart';
import '../widgets/myButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class register extends StatefulWidget {
  final Function()? check;

  const register({super.key, this.check});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final batchController = TextEditingController();
  final nameController = TextEditingController();
  final semesterController = TextEditingController();
  final enrollController = TextEditingController();
  void create() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (passwordController.text == confirmpasswordController.text) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) async {
          //print(value.user);
          Navigator.of(context).pop();

          print("where");
          await FirebaseFirestore.instance
              .collection("userData")
              .doc(value.user?.uid)
              .set({
            "email": value.user?.email,
            "name": nameController.text,
            "enroll": enrollController.text,
            "semester": semesterController.text,
            "batch": batchController.text,
            "id": value.user?.uid,
            "pic":
                'https://steamuserimages-a.akamaihd.net/ugc/1658975992873119928/D51F3889E81F40389CD31A9D14CCB0E75431EC3D/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false'
          });

          print("here");
        });
      } on FirebaseAuthException catch (e) {
        Navigator.of(context).pop();
        showErrormsg(e.code);
        //print(e);
      }
    } else {
      Navigator.of(context).pop();

      showErrormsg("passwords dont match");
    }
    //Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void showErrormsg(String st) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              st,
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
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromARGB(255, 198, 250, 9),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            child: SafeArea(
                child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Icon(Icons.app_registration, size: 100),
                  const SizedBox(height: 30),
                  const Text('Create a new account here',
                      style: TextStyle(
                          color: Color.fromARGB(255, 92, 91, 91),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  myTextField(emailController, 'email', false),
                  const SizedBox(height: 15),
                  myTextField(nameController, 'name', false),
                  const SizedBox(height: 15),
                  myTextField(passwordController, 'password', true),
                  const SizedBox(height: 15),
                  myTextField(
                      confirmpasswordController, 'confirm password', true),
                  const SizedBox(height: 15),
                  myTextField(batchController, 'batch', false),
                  const SizedBox(height: 15),
                  myTextField(semesterController, 'semester', false),
                  const SizedBox(height: 15),
                  myTextField(enrollController, 'enrollment number', false),
                  const SizedBox(height: 15),
                  const SizedBox(height: 25),
                  MyButton(create, 'Create Account'),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already a member? ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 92, 91, 91),
                              fontSize: 18,
                            )),
                        GestureDetector(
                          onTap: widget.check,
                          child: Text('Sign In Now',
                              style: TextStyle(
                                color: Color.fromARGB(147, 5, 29, 240),
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
    ;
  }
}
