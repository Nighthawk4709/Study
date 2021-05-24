import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:study/animation/background_painter.dart';
import 'package:study/layoutapp/video_conferencing/video.dart';
import 'package:study/login/login.dart';
import 'Dashboard_courses/basic_layout.dart';
import 'Calendar_events/calendar.dart';
import 'Dashboard_courses/drawer.dart';

// this will be the section for ui of dashboard and all elements in app
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => HomeScreen(),
      );
  int _selectedIndex = 0;

  final tabs = [
    Basic(),
    Video(), //meet
    Calendar(),
    Basic(), //assignment
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMain(),
      appBar: AppBar(
        title: Text("Study Meet"),
        actions: [
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.calendar_today),
            label: Text("Today's events"),
            splashColor: ExtendedColor.lightBlue,
          )
        ],
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: ExtendedColor.darkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_rounded),
              label: 'Meet',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Events',
              backgroundColor: ExtendedColor.darkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_ind),
              label: 'Work',
              backgroundColor: Colors.purple),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
