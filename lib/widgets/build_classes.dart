import '/constants.dart';
import '/models/classes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildClasses extends StatefulWidget {
  const BuildClasses({super.key});

  @override
  State<BuildClasses> createState() => _BuildClassesState();
}

class _BuildClassesState extends State<BuildClasses> {
  final DateFormat dateFormat = DateFormat('hh:mm a');
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
