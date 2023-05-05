import '/constants.dart';
import '/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class BuildClasses extends StatefulWidget {
  const BuildClasses({super.key});

  @override
  State<BuildClasses> createState() => _BuildClassesState();
}

var n_title, n_body;
Future<void> scheduleNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0,
      channelKey: 'important_notifications',
      title: n_title,
      body: n_body,
      wakeUpScreen: true,
      category: NotificationCategory.Reminder,
      // notificationLayout: NotificationLayout.BigPicture,
      // bigPicture: 'asset://assets/images/delivery.jpeg',
      payload: {'uuid': 'uuid-test'},
      autoDismissible: false,
      // bigPicture: 'https://example.com/image.png',
      // notificationLayout: NotificationLayout.BigPicture,
    ),
    schedule: NotificationCalendar.fromDate(
      date: DateTime.now(),
      // hour: 16,
      // minute: 0,
      // second: 0,

      repeats: true,
      allowWhileIdle: true,
    ),
  );
}

_triggerNotification(@required String notification_title,
    @required String notification_body) async {
  print('idhar bhi aaaya hai');

  n_title = notification_title;
  n_body = notification_body;
  await scheduleNotification();
}

class _BuildClassesState extends State<BuildClasses> {
  final DateFormat dateFormat = DateFormat('hh:mm a');
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed)
        AwesomeNotifications().requestPermissionToSendNotifications();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: classes.length,
      itemBuilder: (BuildContext context, int index) {
        Classes c = classes[index];

        _getStatus(c);
        return Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${dateFormat.format(c.time as DateTime)}',
                  style: TextStyle(
                      color: c.isPassed
                          ? Colors.white.withOpacity(0.2)
                          : Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 20.0),
                _getTime(c, context),
                SizedBox(width: 20.0),
                Text(
                  c.subject as String,
                  style: TextStyle(
                    color: c.isPassed
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 20.0),
                c.isHappening
                    ? Container(
                        height: 25.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                    : Container(),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 117.0, bottom: 20.0),
                  width: 2,
                  height: 100.0,
                  color: c.isPassed ? kTextColor.withOpacity(0.3) : kTextColor,
                ),
                SizedBox(width: 28.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(width: 2.0),
                        Icon(
                          Icons.location_on,
                          color: c.isPassed
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3)
                              : Theme.of(context).colorScheme.secondary,
                          size: 20.0,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          c.type as String,
                          style: TextStyle(
                            color: c.isPassed
                                ? kTextColor.withOpacity(0.3)
                                : kTextColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: c.isPassed
                              ? Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3)
                              : Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          c.teacherName as String,
                          style: TextStyle(
                            color: c.isPassed
                                ? kTextColor.withOpacity(0.3)
                                : kTextColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }

  _getStatus(Classes c) {
    DateTime now = DateTime.now();
    DateTime finishedTime = c.time!.add(const Duration(hours: 1));
    if (now.difference(c.time as DateTime).inMinutes >= -30) {
      print('idhar aaya hai');
      _triggerNotification(c.subject as String, 'class in ${c.time} minutes');
    }
    if (now.difference(c.time as DateTime).inMinutes >= 59)
      c.isPassed = true;
    else if (now.difference(c.time as DateTime).inMinutes <= 59 &&
        now.difference(finishedTime).inMinutes >= -59) c.isHappening = true;
  }

  _getTime(Classes c, context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      height: 25.0,
      width: 25.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: c.isPassed
              ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
              : Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: _getChild(c, context),
    );
  }

  _getChild(Classes c, context) {
    if (c.isPassed) {
      return Icon(
        Icons.check,
        color: c.isPassed
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.3)
            : Theme.of(context).colorScheme.secondary,
        size: 15.0,
      );
    } else if (c.isHappening) {
      print('came here');
      return Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
      );
    }
    return null;
  }
}
