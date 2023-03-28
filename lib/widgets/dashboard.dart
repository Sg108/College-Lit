import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Text('5th Semester Course Schedule'),
        ),
        body: Container(
          child: SfCalendar(
              view: CalendarView.workWeek,
              timeSlotViewSettings: TimeSlotViewSettings(
                  startHour: 9,
                  endHour: 17,
                  nonWorkingDays: <int>[DateTime.friday, DateTime.saturday]),
              dataSource: MeetingDataSource(_getDataSource()),
              monthViewSettings: MonthViewSettings(showAgenda: true)),
        )

        // SingleChildScrollView(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: <Widget>[
        //       TableCalendar(
        //         events: _events,
        //         initialCalendarFormat: CalendarFormat.week,
        //         calendarStyle: CalendarStyle(
        //             canEventMarkersOverflow: true,
        //             todayColor: Colors.orange,
        //             selectedColor: Theme.of(context).primaryColor,
        //             todayStyle: const TextStyle(
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 18.0,
        //                 color: Colors.white)),
        //         headerStyle: HeaderStyle(
        //           centerHeaderTitle: true,
        //           formatButtonVisible: false,
        //           // formatButtonDecoration: BoxDecoration(
        //           //   color: Colors.red,
        //           //   borderRadius: BorderRadius.circular(20.0),
        //           // ),
        //           // formatButtonTextStyle: const TextStyle(color: Colors.white),
        //           formatButtonShowsNext: false,
        //         ),
        //         startingDayOfWeek: StartingDayOfWeek.monday,
        //         onDaySelected: (date, events, holidays) {
        //           setState(() {
        //             _selectedEvents = events;
        //           });
        //         },
        //         builders: CalendarBuilders(
        //           selectedDayBuilder: (context, date, events) => Container(
        //               margin: const EdgeInsets.all(4.0),
        //               alignment: Alignment.center,
        //               decoration: BoxDecoration(
        //                   color: Theme.of(context).primaryColor,
        //                   borderRadius: BorderRadius.circular(10.0)),
        //               child: Text(
        //                 date.day.toString(),
        //                 style: TextStyle(color: Colors.white),
        //               )),
        //           todayDayBuilder: (context, date, events) => Container(
        //               margin: const EdgeInsets.all(4.0),
        //               alignment: Alignment.center,
        //               decoration: BoxDecoration(
        //                   color: Colors.orange,
        //                   borderRadius: BorderRadius.circular(10.0)),
        //               child: Text(
        //                 date.day.toString(),
        //                 style: TextStyle(color: Colors.white),
        //               )),
        //         ),
        //         calendarController: _controller,
        //       ),
        //       ..._selectedEvents.map((event) => Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               height: MediaQuery.of(context).size.height / 20,
        //               width: MediaQuery.of(context).size.width / 2,
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(30),
        //                   color: Colors.white,
        //                   border: Border.all(color: Colors.grey)),
        //               child: Center(
        //                   child: Text(
        //                 event,
        //                 style: const TextStyle(
        //                     color: Colors.blue,
        //                     fontWeight: FontWeight.bold,
        //                     fontSize: 16),
        //               )),
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
        // // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.black,
        //   child: Icon(Icons.add),
        //   onPressed: _showAddDialog,
        );
  }

  // _showAddDialog() async {
  //   await showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             backgroundColor: Colors.white70,
  //             title: Text("Add Events"),
  //             content: TextField(
  //               controller: _eventController,
  //             ),
  //             actions: <Widget>[
  //               TextButton(
  //                 child: const Text(
  //                   "Save",
  //                   style: TextStyle(
  //                       color: Colors.red, fontWeight: FontWeight.bold),
  //                 ),
  //                 onPressed: () {
  //                   if (_eventController.text.isEmpty) return;
  //                   setState(() {
  //                     if (_events[_controller.selectedDay] != null) {
  //                       _events[_controller.selectedDay]
  //                           ?.add(_eventController.text);
  //                     } else {
  //                       _events[_controller.selectedDay] = [
  //                         _eventController.text
  //                       ];
  //                     }
  //                     prefs.setString(
  //                         "events", json.encode(encodeMap(_events)));
  //                     _eventController.clear();
  //                     Navigator.pop(context);
  //                   });
  //                 },
  //               )
  //             ],
  //           ));
  // }
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
