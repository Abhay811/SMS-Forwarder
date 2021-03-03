import 'package:flutter/material.dart';
import 'package:sms_forwarder/messageSender.dart';
// import 'package:sms_forwarder/screens/addRule.dart';
import 'package:sms_forwarder/screens/homeScreen.dart';


void main() {
  runApp(
    MaterialApp(
      title: 'Text',
      home: _Home(),
    ),
  );
}

class _Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title: Text('SMS Forwarder'),
      // ),
      // body: Permissions(),
      // body: HomeScreen(),
      body: SendMessage(),
    );
  }
}