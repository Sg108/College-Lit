import 'package:flutter/material.dart';

class ExaminationDetailsScreen extends StatelessWidget {
  const ExaminationDetailsScreen({super.key});
  static const routeName = '/examination_details';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Examination Details'),
      ),
    );
  }
}
