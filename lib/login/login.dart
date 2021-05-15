import 'package:flutter/material.dart';
import 'package:study/animation/background_painter.dart';
import 'authenticate.dart';

//here we will create the front-end required for client side

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(),
            ),
          )
        ],
      ),
    );
  }
}
