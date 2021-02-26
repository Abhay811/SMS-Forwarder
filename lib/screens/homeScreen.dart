import 'package:flutter/material.dart';
import '../style.dart';
import 'ruleListScreen.dart';
import 'navigationDrawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SMS Forwarder'),
          backgroundColor: kThemebgColor,
        ),
        body: RuleListScreen(),
        drawer: NavigationDrawer(),
      ),
    );
  }
}
