import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ClassInfo {
  final String id;
  final DateTime timing;
  final String title;
  final String teacher;
  final String venue;
  ClassInfo({
    required this.id,
    required this.timing,
    required this.title,
    required this.teacher,
    required this.venue,
  });
}
