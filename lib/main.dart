import 'package:flutter/material.dart';
import 'screens/homeScreen.dart';

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
      body: HomeScreen(),
    );
  }
}
