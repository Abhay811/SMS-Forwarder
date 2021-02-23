import 'package:flutter/material.dart';
import 'package:sms_forwarder/style.dart';

class AddRule extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddRuleScreen();
}

class AddRuleScreen extends State<AddRule> {
  final int ind = 0;

  // bool _hasBeenPressed = false;
  int _currentColorIndex = 0;

  final _controllerForwardFrom = TextEditingController();
  final _controllerForwardTo = TextEditingController();
  final _controllerMsgContent = TextEditingController();
  final _controllerExclude = TextEditingController();
  final _controllerDailyLimit = TextEditingController();

  void _incrementColorIndex() {
    setState(() {
      _currentColorIndex++;
      _currentColorIndex = _currentColorIndex % colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(
          'SMS Forwarder',
        ),
        backgroundColor: kThemebgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                "Rule",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              height: 40,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 28, 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    border: Border.all(color: Colors.grey[600]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Forward\nfrom:"),
                ),
                Container(
                  width: 10,
                ),
                Container(
                  height: 30,
                  child: FlatButton(
                    minWidth: 20,
                    child: Text('Any'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: colors[_currentColorIndex],
                    onPressed: () {
                      _incrementColorIndex();
                    },
                  ),
                ),
                Container(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 35,
                    child: TextField(
                      controller: _controllerForwardFrom,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 28, 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Forward\nto:"),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    child: TextField(
                      controller: _controllerForwardTo,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Based on\nmessage\ncontent:"),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 80,
                    child: TextField(
                      controller: _controllerMsgContent,
                      maxLines: 2,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 28, 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Exclude:"),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    child: TextField(
                      controller: _controllerExclude,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      color: Colors.grey[600],
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text("Daily sms\nLimit:"),
                ),
                Container(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    child: TextField(
                      controller: _controllerDailyLimit,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 30,
                          color: Colors.black12),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 110,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Text(
                            'Add',
                            style: Theme.of(context).textTheme.button.apply(
                                  color: Colors.black,
                                  fontSizeDelta: 5,
                                ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              topLeft: Radius.circular(90),
                              bottomRight: Radius.circular(200),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 20,
                ),
                Container(
                  // height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 20),
                          blurRadius: 30,
                          color: Colors.black12),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 50,
                          width: 110,
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: Text(
                            'Clear',
                            style: Theme.of(context).textTheme.button.apply(
                                  color: Colors.black,
                                  fontSizeDelta: 5,
                                ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(90),
                              topLeft: Radius.circular(90),
                              bottomRight: Radius.circular(200),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.backspace,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}