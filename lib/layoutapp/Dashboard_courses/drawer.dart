import 'package:flutter/material.dart';
import 'package:study/layoutapp/Calendar_events/calendar.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class DrawerMain extends Drawer {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.60,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('User Info'),
              // this will show all the user details from firebase
            ),
            ListTile(
              title: Text('Enrolled Courses'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Attendance'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                context.signOut();
                //Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
