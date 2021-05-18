import 'package:flutter/material.dart';
import 'package:study/animation/background_painter.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'signin.dart';
import 'register.dart';

//here we will create the front-end required for client side

class LogInscreen extends StatefulWidget {
  @override
  _LogInscreenState createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

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
      body: LitAuth.custom(
          child: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
              valueListenable: showSignInPage,
              builder: (context, value, child) {
                return value
                    ? SignIn(
                        onRegisterClicked: () {
                          context.resetSignInForm();
                          showSignInPage.value = false;
                          _controller.forward();
                        },
                      )
                    : Register(onSignInPressed: () {
                        context.resetSignInForm();
                        showSignInPage.value = true;
                        _controller.reverse();
                      });
              })
        ],
      )),
    );
  }
}
