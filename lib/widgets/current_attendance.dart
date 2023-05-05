import 'package:provider/provider.dart';
import 'dart:math';
import '../models/student_provider.dart';
import '/constants.dart';
import '/widgets/countdown_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/alert.dart';
import '/models/courses.dart';

class CurrentAttendance extends StatefulWidget {
  const CurrentAttendance({super.key});

  @override
  State<CurrentAttendance> createState() => _CurrentAttendanceState();
}

class Subject {
  String? sub;
  double? pct;
  Subject(String subname, double percent) {
    this.sub = subname;
    this.pct = percent;
  }
}

List<Subject> Subjects = [
  Subject('Adv. Blockchain', 72),
  Subject('Big Data', 68),
  Subject('IOT Analytics', 54),
  Subject('IRSW', 88),
  Subject('IOT Lab', 50),
  Subject('Deep Learning', 100)
];

class _CurrentAttendanceState extends State<CurrentAttendance> {
  final DateFormat dateFormat = DateFormat("hh:mm a");
  final CourseList = semcourses.Courses;
  int sem = 0;
  bool init = true;
  final percentages = semcourses.percentage;
  List allSemCourses = [];
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    if (init) {
      sem = Provider.of<Student>(context).semester;
      for (int i = 0; i < CourseList[sem]!['core']!.length; i++) {
        allSemCourses.add([CourseList[sem]!['core']![i], percentages[i]]);
      }
      for (int i = 0; i < CourseList[sem]!['elective']!.length; i++) {
        allSemCourses.add([CourseList[sem]!['elective']![i], percentages[i]]);
      }
      init = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: allSemCourses.length,
      itemBuilder: (BuildContext context, int index) {
        String subject = allSemCourses[index][0] as String;
        double percent = allSemCourses[index][1] / 100;
        return Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30.0),
              height: 130.0,
              width: 15.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30.0),
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 5.0, 10.0),
              height: 130.0,
              width: 326.0,
              decoration: const BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.subject_sharp,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 24.0,
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: 140,
                            child: Text(
                              subject,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              softWrap: false,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          _getIcon(percent),
                          const SizedBox(width: 10.0),
                          _getNote(percent),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0.0,
                    child: CustomPaint(
                      foregroundPainter: CountdownPainter(
                        bgColor: kBGColor,
                        lineColor: _getColor(context, percent),
                        percent: percent,
                        width: 4.0,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '${(percent * 100).toStringAsFixed(1)}',
                              style: TextStyle(
                                color: _getColor(context, percent),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '%',
                              style: TextStyle(
                                color: _getColor(context, percent),
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _getColor(BuildContext context, double percent) {
    if (percent > 0.75)
      return Theme.of(context).colorScheme.secondary;
    else if (percent > 0.6) return Colors.amber[700];
    return Colors.red[900];
  }

  _getIcon(double percent) {
    if (percent > 0.75)
      return Icon(
        Icons.check_box,
        color: Theme.of(context).colorScheme.secondary,
      );
    else if (percent > 0.6)
      return Icon(
        Icons.watch_later,
        color: Colors.amber[900],
      );
    return Icon(
      Icons.warning_amber_sharp,
      color: Colors.red[900],
    );
  }

  _getNote(double percent) {
    final String note;
    if (percent > 0.75)
      note = 'You are doing great!';
    else if (percent > 0.6)
      note = 'Attend more classes!';
    else
      note = 'Warning! Too Low';
    return Text(note,
        style: const TextStyle(
          color: kTextColor,
          fontSize: 15.0,
        ));
  }
}
