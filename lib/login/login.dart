import 'package:flutter/material.dart';
import 'package:study/animation/background_painter.dart';
import 'authenticate.dart';

//here we will create the front-end required for client side

class Loginscreen extends StatefulWidget {
  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    //TODO: implement init state
    // vsync triggers update
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          Center(
              child: RaisedButton(
            onPressed: () {
              _controller.forward(from: 0);
            },
            child: Text('Animate'),
          )),
        ],
      ),
    );
  }
}
