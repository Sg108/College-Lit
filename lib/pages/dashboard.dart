import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student_provider.dart';
import '../widgets/MainDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/attendence_screen.dart';
import '../screens/timetable_screen.dart';
import '../screens/update_profile_screen.dart';
import '../screens/registration_screen.dart';
import '../screens/examination_details_screen.dart';
import '../widgets/myTextfields.dart';
import '../widgets/myButton.dart';

class dashboard extends StatefulWidget {
  var id;

  dashboard(this.id);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  //var _user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;
  bool first = true;
  var usernameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("t");

    // if (first) {
    //   getdata();
    //   first = false;
    // }
  }

  void getdata() async {
    // isLoading = false;
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(widget.id)
        .get()
        .then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<dynamic, dynamic>;
        Provider.of<Student>(context, listen: false)
            .initiate(widget.id, data['email']);
        Provider.of<Student>(context, listen: false).setData(data['name'],
            data['email'], data['batch'], data['enroll'], data['semester']);

        // isLoading = false;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    print("there");
    setState(() {
      isLoading = false;
    });
    // Navigator.of(context).pop();
  }

  @override
  void didUpdateWidget(covariant dashboard oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout)),
            // IconButton(
            //     onPressed: () {
            //       _addUsername(context);
            //     },
            //     icon: Icon(Icons.add))
          ],
        ),
        body: isLoading
            ? Center(child: const CircularProgressIndicator())
            : Center(child: Text('hi ${Provider.of<Student>(context).name}')));
  }
}
