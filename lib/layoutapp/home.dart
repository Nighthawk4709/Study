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
  // this will be used to get the profile of user
  /*Future getSignedInUser() async{

  }*/

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
        backgroundColor: Colors.transparent,
        title: Text("Study Meet"),
        actions: [
          Container(
            height: 35.0,
            width: 35.0,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Colors.grey,
                onPressed: () {},
                child: Icon(
                  Icons.person,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.purple,
              ),
              label: 'Home',
              backgroundColor: ExtendedColor.darkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_rounded, color: Colors.purple),
              label: 'Meet',
              backgroundColor: Colors.purple),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: Colors.purple,
              ),
              label: 'Events',
              backgroundColor: ExtendedColor.darkBlue),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment_ind,
                color: Colors.purple,
              ),
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
