import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Student {
  final int id;
  final String name;
  final String batch;
  final String email;
  final String picture;
  Student(
      {required this.id,
      required this.name,
      required this.batch,
      required this.email,
      required this.picture});
}
