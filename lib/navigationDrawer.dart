import 'package:flutter/material.dart';
import './customListTile.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.blue,
                  Colors.blueAccent,
                ],
              ),
            ),
            child: Container(
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(11),
                      child: Image.asset(
                        'images/icon_male_pic.png',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          CustomListTile(Icons.star, 'Rate App', () => {}),
          CustomListTile(Icons.library_books, 'Usage Guide', () => {}),
          CustomListTile(Icons.priority_high_rounded, 'About us', () => {}),
        ],
      ),
    );
  }
}
