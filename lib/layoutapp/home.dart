import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:study/animation/background_painter.dart';
import 'package:study/login/login.dart';
import 'Dashboard_courses/basic_layout.dart';
import 'Calendar_events/calendar.dart';
import 'Dashboard_courses/drawer.dart';
import 'package:study/layoutapp/Dashboard_courses/bottomAppBar.dart';

// this will be the section for ui of dashboard and all elements in app

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

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
      body: SafeArea(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.height * 0.15,
                child: Text(
                  "Courses",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(child: Basic())
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar1(),
    );
  }
}
