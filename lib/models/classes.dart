class Classes {
  final String? subject;
  final String? type;
  final String? teacherName;
  final DateTime? time;
  bool isPassed = false;
  bool isHappening = false;

  Classes({this.subject, this.type, this.teacherName, this.time});
}

List<Classes> classes = [
  Classes(
    subject: "Adv. Blockchain",
    type: "FF7",
    teacherName: "Naveen Kumar",
    time: DateTime.parse("2023-05-06 09:00:00"),
  ),
  Classes(
    subject: "IOT Analytics",
    type: "G5",
    teacherName: "Amarjeet Kaur",
    time: DateTime.parse("2023-05-06 10:15:00"),
  ),
  Classes(
    subject: "Big Data",
    type: "FF5",
    teacherName: "Sulabh Tyagi",
    time: DateTime.parse("2023-05-06 14:30:00"),
  ),
  Classes(
    subject: "IRSW",
    type: "Online Class",
    teacherName: "Neetu Sardana",
    time: DateTime.parse("2023-05-06 17:30:00"),
  ),
];
