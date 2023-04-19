import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/student_provider.dart';
import '../widgets/myTextfields.dart';
import '../widgets/myButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  static const routeName = '/update_profile';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var batchController = TextEditingController();
  var semesterController = TextEditingController();
  var enrollController = TextEditingController();
  bool mount = true;
  void initState() {
    //default text
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    print("k");
    if (mount) {
      print("p");
      //print(Provider.of<Student>(context).name);
      nameController.text = Provider.of<Student>(context).name;
      emailController.text = Provider.of<Student>(context).email;
      batchController.text = Provider.of<Student>(context).batch;
      enrollController.text = Provider.of<Student>(context).enroll;
      semesterController.text = Provider.of<Student>(context).semester;
      mount = false;
    }
  }

  submit(BuildContext ctx) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(Provider.of<Student>(context, listen: false).id)
        .set({
      "email": emailController.text,
      "name": nameController.text,
      "enroll": enrollController.text,
      "semester": semesterController.text,
      "batch": batchController.text,
      "pic": Provider.of<Student>(context, listen: false).pic
    }, SetOptions(merge: true));

    Navigator.of(context).pop();
    Provider.of<Student>(ctx, listen: false).setData(
      nameController.text,
      emailController.text,
      batchController.text,
      enrollController.text,
      semesterController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(nameController.text);
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Update Profile')),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              //color: Colors.amber,
                              image: DecorationImage(
                                image: NetworkImage(
                                    Provider.of<Student>(context).pic),
                                //fit: BoxFit.contain
                              ),
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1)),
                              ]),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 45,
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(width: 4, color: Colors.white),
                                  color: Colors.blue),
                              child: IconButton(
                                onPressed: () async {
                                  /*
                * Step 1. Pick/Capture an image   (image_picker)
                * Step 2. Upload the image to Firebase storage
                * Step 3. Get the URL of the uploaded image
                * Step 4. Store the image URL inside the corresponding
                *         document of the database.
                * Step 5. Display the image on the list
                *
                * */

                                  /*Step 1:Pick image*/
                                  //Install image_picker
                                  //Import the corresponding library

                                  ImagePicker imagePicker = ImagePicker();
                                  XFile? file = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  print('${file?.path}');

                                  if (file == null) return;
                                  //Import dart:core
                                  String uniqueFileName = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();

                                  /*Step 2: Upload to Firebase storage*/
                                  //Install firebase_storage
                                  //Import the library

                                  //Get a reference to storage root
                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirImages =
                                      referenceRoot.child('images');

                                  //Create a reference for the image to be stored
                                  Reference referenceImageToUpload =
                                      referenceDirImages.child(uniqueFileName);

                                  //Handle errors/success
                                  try {
                                    //Store the file
                                    await referenceImageToUpload
                                        .putFile(File(file.path));
                                    //Success: get the download URL
                                    String pic = await referenceImageToUpload
                                        .getDownloadURL();
                                    Provider.of<Student>(context, listen: false)
                                        .getPic(pic);
                                  } catch (error) {
                                    //Some error occurred
                                  }
                                },
                                icon: Icon(Icons.photo),
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TxtField(nameController, "Name", false)),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TxtField(emailController, "Email", false)),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TxtField(batchController, "Batch", false)),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TxtField(semesterController, "Semester", false)),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: TxtField(
                          enrollController, "Enrollment Number", false)),
                  MyButton(() => {submit(context)}, "Save")
                ],
              )),
        ));
  }
}

void initialize() async {}
