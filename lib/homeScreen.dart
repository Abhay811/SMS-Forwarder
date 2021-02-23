import 'package:flutter/material.dart';
import './style.dart';
import './ruleListScreen.dart';
import './navigationDrawer.dart';

class HomeScreen extends StatelessWidget {
  final int index = 0;
  final List<Widget> list = [
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
