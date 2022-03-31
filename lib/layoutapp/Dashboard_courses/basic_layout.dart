import 'package:flutter/material.dart';

// names instructor and images will be provided form the admin login section
// still need to make that part

class Basic extends StatefulWidget {
  @override
  _BasicState createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hi"),
    );
  }
}

Color primaryGreen = Color(0xff416d6d);
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))
];
