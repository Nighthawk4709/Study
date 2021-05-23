import 'package:flutter/material.dart';
import 'package:study/layoutapp/Calendar_events/calendar.dart';

import '../home.dart';

class BottomAppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
        child: Container(
      width: MediaQuery.of(context).size.height * 0.20,
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.home,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.meeting_room,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.calendar_today,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Calendar(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.assignment_ind,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
        ],
      ),
    ));
  }
}

class BottomAppBar2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
        child: Container(
      width: MediaQuery.of(context).size.height * 0.20,
      child: Row(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.home,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.meeting_room,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.calendar_today,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Calendar(),
                    ),
                  );
                },
              )),
          Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: ElevatedButton(
                child: Icon(
                  Icons.assignment_ind,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple[100],
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              )),
        ],
      ),
    ));
  }
}
