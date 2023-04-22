import 'dart:math';

import 'package:flutter/cupertino.dart';

class CountdownPainter extends CustomPainter {
  final Color? bgColor;
  final Color? lineColor;
  final double? percent;
  final double? width;

  CountdownPainter({this.bgColor, this.lineColor, this.percent, this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor as Color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width as double;

    Paint completeLine = Paint()
      ..color = lineColor as Color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width as double;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    double sweepAngle = 2 * pi * (percent as num);

    canvas.drawCircle(center, radius, bgLine);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
