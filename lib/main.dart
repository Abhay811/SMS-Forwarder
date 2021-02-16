import 'package:flutter/material.dart';
import 'package:sms_forwarder/homeScreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Text',
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
