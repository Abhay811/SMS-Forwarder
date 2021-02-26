import 'package:flutter/material.dart';
import '../style.dart';
import '../customListTile.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                kThemebgColor,
                kThemefgColor,
              ],
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              CustomListTile(Icons.star, 'Rate App', () => {}),
              CustomListTile(Icons.library_books, 'Usage Guide', () => {}),
              CustomListTile(Icons.priority_high_rounded, 'About us', () => {}),
            ],
          ),
        ),
      ),
    );
  }
}
