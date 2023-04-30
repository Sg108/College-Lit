import 'package:flutter/material.dart';

import 'package:college_bytes/screens/courses_recommended_screen.dart';

class GradesInput extends StatefulWidget {
  @override
  _GradesInputState createState() => _GradesInputState();
}

class _GradesInputState extends State<GradesInput> {
  int sem = 5;
  final Map<dynamic, Map<dynamic, List<dynamic>>> _allCourses = {
    1: {
      'core': [
        'Mathematics-1',
        'Physics-1 ',
        'Software Development Fundamentals-I',
        'English',
        'Physics Lab-1',
        'Software Development Lab-I ',
        'Engineering Drawing & Design'
      ],
      'elective': []
    },
    2: {
      'core': [
        'Mathematics-2',
        'Physics-2 ',
        'Electrical Science-I',
        'Software Development FundamentalsII',
        'Physics Lab-2',
        'Electrical Science Lab-I',
        'Software Development Lab-II',
        'Workshop '
      ],
      'elective': []
    },
    3: {
      'core': [
        'Theoretical Foundations of Computer Science',
        'Database Systems and Web ',
        'Data Structures ',
        'Data Structures Lab',
        'Database Systems and Web Lab ',
        'Electrical Science-II',
        'Electrical Science Lab-II',
        'Economics '
      ],
      'elective': []
    },
    4: {
      'core': [
        'Probability and Random Processes',
        'Digital Systems',
        'Algorithms and Problem Solving',
        'Environmental Science',
        'Digital Systems Lab',
        'Algorithms and Problem Solving Lab',
        'Life Skills'
      ],
      'elective': []
    },
    5: {
      'core': [
        'Computer Organisation and Architecture',
        'Minor Project-1',
        'Open Source Software lab',
        'Operating Systems and Systems Programming',
        'Information Security Lab',
        'Indian Constitution and Traditional Knowledge'
      ],
      'elective': [
        'Fundamentals of Machine learning',
        'Fundamentals of Computer security',
        'Introduction to Big data and Data Analytics',
        'Object Oriented Analysis and Design using Java',
        'Image Processing and Computer Vision',
        'Automata Theory and its applications',
      ]
    },
    6: {
      'core': [
        'Computer Networks and Internet of Things',
        'Computer Networks and Internet of Things Lab',
        'Software Engineering',
        'Artificial Intelligence',
        'Software Engineering Lab',
        'Artifical Intelligence Lab',
        'Minor Project -2'
      ],
      'elective': [
        'Sensor Technology & Android Programming',
        'Fundamentals of Distributed and Cloud Computing',
        'Introduction to Large Scale Database Systems',
        'Web Technology and Cyber Security',
        'Introduction to Compiler Design',
        'Cloud based Enterprise Systems',
      ]
    },
    7: {
      'core': ['Major Project Part-1', 'Summer Training Viva'],
      'elective': [
        'Advanced Blockchain : A game theoretic view',
        'Big Data with Hadoop and Spark',
        'Introduction to Deep Learning',
        'Cryptography and its Applications',
        'Information Retrieval and Semantic Web',
        'IoT Analytics',
      ]
    },
    8: {
      'core': ['Major Project Part-2'],
      'elective': [
        'Optimization Techniques',
        'Artificial Intelligence for Healthcare',
        'Cloud Computing Essentials: Azure, AWS and Google Cloud',
        'Agile: Software development and processes',
        'Kubernetes',
        'International Studies'
      ]
    },
  };

  List<TextEditingController> _gradeControllers = [];
  List<String> _courses = [];
  List<double> grades = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < _allCourses[sem]!['core']!.length; i++) {
      _courses.add(_allCourses[sem]!['core']![i]);
      _gradeControllers.add(TextEditingController());
    }
    for (int i = 0; i < _allCourses[sem]!['elective']!.length; i++) {
      _courses.add(_allCourses[sem]!['elective']![i]);
      _gradeControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Subjects Registration"),
          automaticallyImplyLeading: false),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                                      Text(_courses[i]),
                                      SizedBox(height: 8.0),
                                      TextFormField(
                                        controller: _gradeControllers[i],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
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
                                        Text(_courses[i + 1]),
                                        SizedBox(height: 8.0),
                                        TextFormField(
                                          controller: _gradeControllers[i + 1],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
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
                                        Text(_courses[i + 2]),
                                        SizedBox(height: 8.0),
                                        TextFormField(
                                          controller: _gradeControllers[i + 2],
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
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
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                  for (int i = 0; i < _courses.length; i++) {
                    grades.add(double.parse(_gradeControllers[i].text));
                  }
                  setState(() {});
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RecommendedScreen()));
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              Text('${grades}')
            ],
          ),
        ),
      ),
    );
  }
}
