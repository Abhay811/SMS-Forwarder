import 'package:flutter/material.dart';
import 'package:sms_forwarder/style.dart';
import './ruleListScreen.dart';
import './navigationDrawer.dart';

class HomeScreen extends StatelessWidget {
  int index = 0;
  List<Widget> list = [
    RuleListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMS Forwarder'),
          backgroundColor: kThemebgColor,
        ),
        body: list[index],
        drawer: NavigationDrawer(),
      ),
    );
  }
}
