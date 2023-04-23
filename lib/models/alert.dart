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
    time: DateTime.parse('2023-04-23 18:30:00'),
  ),
  Alert(
    title: 'IEEE',
    subject: 'Hub Orientation',
    time: DateTime.parse('2023-04-24 07:15:00'),
  )
];
