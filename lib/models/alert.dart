class Alert {
  final String? title;
  final String? subject;
  final DateTime? time;
  Alert({this.title, this.subject, this.time});
}

List<Alert> recentAlerts = [
  Alert(
    title: 'College Fest',
    subject: 'Impressions 2023',
    time: DateTime.parse('2023-05-06 17:30:00'),
  ),
  Alert(
    title: 'Fourth Years Farewell',
    subject: 'Farewell 2023',
    time: DateTime.parse('2023-05-10 08:00:00'),
  )
];
