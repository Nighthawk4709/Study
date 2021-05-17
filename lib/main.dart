import 'package:flutter/material.dart';
import 'package:study/login/login.dart';

void main() {
  runApp(MyApp());
}
// on opening of screen we will make show login page
// if he/she is not having account he/she can create one
//after login a splash screen will come which will send them to home.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study',
      theme: ThemeData(backgroundColor: Colors.transparent),
      home: Loginscreen(),
    );
  }
}
