import 'package:flutter/material.dart';

import 'agora_rtc_engine/src/pages/index.dart';

class Video extends StatefulWidget {
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexPage(),
    );
  }
}
