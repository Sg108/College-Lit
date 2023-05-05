import 'package:college_bytes/constants.dart';
import 'package:college_bytes/widgets/header.dart';
import 'package:flutter/material.dart';

import 'package:college_bytes/screens/courses_recommended_screen.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import '../models/courses.dart';

import 'package:provider/provider.dart';

import '../models/student_provider.dart';

class GradesInput extends StatefulWidget {
  @override
  _GradesInputState createState() => _GradesInputState();
}

class _GradesInputState extends State<GradesInput> {
  int sem = 0;
  bool first = true;
  final _allCourses = semcourses.Courses;

  List<TextEditingController> _gradeControllers = [];
  List<String> _courses = [];
  Map grades = {};
  List<dynamic> recommendations = [];
  @override
  void initState() {
    super.initState();
    print("k");
  }

  void didChangeDependencies() {
    print(first);
    if (first) {
      sem = Provider.of<Student>(context).semester;
      print(sem);
      for (int i = 0; i < _allCourses[sem]!['core']!.length; i++) {
        _courses.add(_allCourses[sem]!['core']![i]);
        _gradeControllers.add(TextEditingController());
      }
      for (int i = 0; i < _allCourses[sem]!['elective']!.length; i++) {
        _courses.add(_allCourses[sem]!['elective']![i]);
        _gradeControllers.add(TextEditingController());
      }
      first = false;
    }
    super.didChangeDependencies();
  }

  apicall1() async {
    var url = Uri.parse('https://collegebytesapi.azurewebsites.net/collabf');
    Map data = {
      "grades": grades,
      "courses": sem == 8 ? [] : _allCourses[sem + 1]!['elective']
    };
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    Map<String, dynamic> rec = await jsonDecode(response.body);

    setState(() {
      recommendations = rec['recommendations'] as List<dynamic>;
    });
  }

  apicall2() async {
    var url = Uri.parse('https://collegebytesapi.azurewebsites.net/matrixf');
    Map data = {
      "grades": grades,
      "courses": sem == 8 ? [] : _allCourses[sem + 1]!['elective']
    };
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    Map<String, dynamic> rec = await jsonDecode(response.body);

    setState(() {
      recommendations = rec['recommendations'] as List<dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    var recommendedScreen = RecommendedScreen;
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Header(),
          SizedBox(height: 35.0),
          // Text('${grades}'),

          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0))),
            child: Column(
              children: [
                Text('Enter Grades Obtained in Current Semester',
                    style: TextStyle(color: Colors.white, fontSize: 18.0)),
                SizedBox(height: 15.0),
                Text('(Between 1 and 10)', style: TextStyle(color: kTextColor)),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          for (int i = 0; i < _courses.length; i += 3)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(_courses[i],
                                            style:
                                                TextStyle(color: Colors.white)),
                                        SizedBox(height: 8.0),
                                        TextFormField(
                                          style: TextStyle(color: Colors.white),
                                          cursorColor: Colors.white,
                                          controller: _gradeControllers[i],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  if (i + 1 < _courses.length)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(_courses[i + 1],
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(height: 8.0),
                                          TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            cursorColor: Colors.white,
                                            controller:
                                                _gradeControllers[i + 1],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  SizedBox(width: 16.0),
                                  if (i + 2 < _courses.length)
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(_courses[i + 2],
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          SizedBox(height: 8.0),
                                          TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            cursorColor: Colors.white,
                                            controller:
                                                _gradeControllers[i + 2],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),

          ElevatedButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
              grades = {};
              for (int i = 0; i < _courses.length; i++) {
                grades[_courses[i]] = _gradeControllers[i].text;
              }
              setState(() {});

              await apicall1();

              Navigator.of(context).pop();
              print(recommendations);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecommendedScreen(),
                  settings: RouteSettings(
                    arguments: recommendations,
                  ),
                ),
              );
            },
            child: Text('Recommendations Using Collaborative Filtering'),
          ),
          SizedBox(height: 5.0),

          Container(
            margin: EdgeInsets.only(bottom: 60.0),
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
                grades = {};
                for (int i = 0; i < _courses.length; i++) {
                  grades[_courses[i]] = _gradeControllers[i].text;
                }
                setState(() {});

                await apicall2();

                Navigator.of(context).pop();
                print(recommendations);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecommendedScreen(),
                    settings: RouteSettings(
                      arguments: recommendations,
                    ),
                  ),
                );
              },
              child: Text('Recommendations using Matrix Factorization'),
            ),
          )
        ],
      ),
    );
  }
}
