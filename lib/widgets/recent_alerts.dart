import 'package:college_app/constants.dart';
import 'package:college_app/widgets/countdown_painter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:college_app/models/alert.dart';

class RecentAlerts extends StatefulWidget {
  const RecentAlerts({super.key});

  @override
  State<RecentAlerts> createState() => _RecentAlertsState();
}

class _RecentAlertsState extends State<RecentAlerts> {
  final DateFormat dateFormat = DateFormat("hh:mm a");
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recentAlerts.length,
      itemBuilder: (BuildContext context, int index) {
        Alert alert = recentAlerts[index];
        int hoursLeft =
            DateTime.now().difference(alert.time as DateTime).inHours;
        hoursLeft = hoursLeft < 0 ? -hoursLeft : 0;
        double percent = hoursLeft / 48;
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
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
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
                      Text(
                        alert.title as String,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.watch_later_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 24.0,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            "${DateTime.now().weekday == alert.time!.weekday ? "Today" : DateFormat.EEEE().format(alert.time as DateTime)}, ${dateFormat.format(alert.time as DateTime)}",
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.receipt,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 24.0,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            alert.subject as String,
                            style: const TextStyle(
                              color: kTextColor,
                              fontSize: 15.0,
                            ),
                          )
                        ],
                      )
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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              '${hoursLeft}',
                              style: TextStyle(
                                color: _getColor(context, percent),
                                fontSize: 26.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'hours left',
                              style: TextStyle(
                                color: _getColor(context, percent),
                                fontSize: 13.0,
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
    if (percent >= 0.35) return Theme.of(context).colorScheme.secondary;
    return kHourColor;
  }
}
