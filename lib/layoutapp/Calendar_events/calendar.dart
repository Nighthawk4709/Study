import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'package:study/layoutapp/Dashboard_courses/drawer.dart';
import '../home.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'eventEditingPage.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Scaffold(
        drawer: DrawerMain(),

        body: NewCalendar(),

        //event add in sf calendar
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.create),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EventEditingPage()))),
      ));
}

class NewCalendar extends StatefulWidget {
  @override
  _NewCalendarState createState() => _NewCalendarState();
}

class _NewCalendarState extends State<NewCalendar> {
  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      initialDisplayDate: DateTime.now(),
    );
  }
}
