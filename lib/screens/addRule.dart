import 'package:flutter/material.dart';
import 'package:sms_forwarder/style.dart';
import '../ruleClass.dart';

class AddRule extends StatefulWidget {
  Rule rule;
  AddRule({this.rule});
  @override
  State<StatefulWidget> createState() => AddRuleScreen(rule: rule);
}

class AddRuleScreen extends State<AddRule> {
  final int ind = 0;
  // bool _hasBeenPressed = false;
  int _currentColorIndex = 0;
  Rule rule;
  AddRuleScreen({this.rule});
  bool _isEditingText = false;
  TextEditingController _editingController;
  final _controllerForwardFrom = TextEditingController();
  final _focusForwardFrom = FocusNode();
  final _controllerForwardTo = TextEditingController();
  final _focusForwardTo = FocusNode();
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
  void initState() {
    super.initState();
  }

  Widget _editTitleTextField() {
    if (_isEditingText)
      return TextField(
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        onSubmitted: (newValue) {
          setState(() {
            rule.ruleName = newValue;
            _isEditingText = false;
          });
        },
        autofocus: true,
        controller: _editingController,
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
          _editingController.text = rule.ruleName;
        });
      },
      child: Text(rule.ruleName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (rule == null) rule = Rule();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: _editTitleTextField(),
              ),
              Container(
                height: 30,
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    padding: EdgeInsets.fromLTRB(20, 10, 28, 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[600].withOpacity(0.8),
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
                        maxLength: 12,
                        focusNode: _focusForwardFrom,
                        onChanged: (String str) {
                          // to add string to chip on pressing space
                          bool te = false;
                          str.runes.forEach((ele) {
                            if (ele != 32) {
                              te = true;
                            }
                          });
                          if (te && str.endsWith(' ') && str.length != 1) {
                            str = str.trim();
                            setState(() {
                              rule.forwardFrom.add(str);
                              rule.forwardFrom =
                                  rule.forwardFrom.reversed.toList();
                              _controllerForwardFrom.clear();
                            });
                          }
                        },
                        onEditingComplete: () {
                          //todo:check for valid number
                          String str = _controllerForwardFrom.text;
                          bool te = false;
                          // print(str);
                          str.runes.forEach((ele) {
                            if (ele != 32) {
                              te = true;
                            }
                          });
                          if (te && str.length != 1) {
                            str = str.trim();
                            setState(() {
                              rule.forwardFrom.add(str);
                              rule.forwardFrom =
                                  rule.forwardFrom.reversed.toList();
                              _controllerForwardFrom.clear();
                              _focusForwardFrom.unfocus();
                            });
                          } else
                            _controllerForwardFrom.clear();
                        },
                        controller: _controllerForwardFrom,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          counterText: '',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      List<Widget>.generate(rule.forwardFrom.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: InputChip(
                        backgroundColor: Colors.white70,
                        label: Text(rule.forwardFrom[index]),
                        onPressed: () {
                          setState(() {
                            _controllerForwardFrom.text =
                                rule.forwardFrom[index];
                            rule.forwardFrom.removeAt(index);
                            _focusForwardFrom.requestFocus();
                          });
                        },
                      ),
                    );
                  }),
                ),
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
                      height: 35,
                      child: TextField(
                        maxLength: 12,
                        focusNode: _focusForwardTo,
                        onChanged: (String str) {
                          // to add string to chip on pressing space
                          bool te = false;
                          str.runes.forEach((ele) {
                            if (ele != 32) {
                              te = true;
                            }
                          });
                          if (te && str.endsWith(' ') && str.length != 1) {
                            str = str.trim();
                            setState(() {
                              rule.forwardTo.add(str);
                              rule.forwardTo = rule.forwardTo.reversed.toList();
                              _controllerForwardTo.clear();
                            });
                          }
                        },
                        onEditingComplete: () {
                          //todo:check for valid number
                          String str = _controllerForwardTo.text;
                          bool te = false;
                          // print(str);
                          str.runes.forEach((ele) {
                            if (ele != 32) {
                              te = true;
                            }
                          });
                          if (te && str.length != 1) {
                            str = str.trim();
                            setState(() {
                              rule.forwardTo.add(str);
                              rule.forwardTo = rule.forwardTo.reversed.toList();
                              _controllerForwardTo.clear();
                              _focusForwardTo.unfocus();
                            });
                          } else
                            _controllerForwardTo.clear();
                        },
                        controller: _controllerForwardTo,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          counterText: '',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      List<Widget>.generate(rule.forwardTo.length, (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: InputChip(
                        backgroundColor: Colors.white70,
                        label: Text(rule.forwardTo[index]),
                        onPressed: () {
                          setState(() {
                            _controllerForwardTo.text = rule.forwardTo[index];
                            rule.forwardTo.removeAt(index);
                            _focusForwardTo.requestFocus();
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
              Container(
                height: 20,
              ),
              Row(children: <Widget>[
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
                      onSubmitted: (str) {
                        rule.messageContent = str;
                      },
                      controller: _controllerMsgContent,
                      maxLines: 2,
                      keyboardType: TextInputType.text,
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
              ]),
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
                        onSubmitted: (str) {
                          rule.exclude = str;
                        },
                        controller: _controllerExclude,
                        keyboardType: TextInputType.text,
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
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              //todo: Add sim selecting option
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
                      height: 35,
                      child: TextField(
                        maxLength: 6,
                        onSubmitted: (str) {
                          rule.dailyLimit = int.parse(str);
                        },
                        controller: _controllerDailyLimit,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
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
                  )
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
                          onTap: () {
                            Navigator.pop(context, rule);
                            //todo: save rule to disk
                            print('sfsf');
                          },
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
                          onTap: () {
                            setState(() {
                              rule.forwardFrom.clear();
                              rule.forwardTo.clear();
                              _controllerMsgContent.clear();
                              _controllerExclude.clear();
                              rule.dailyLimit = 0;
                              _controllerDailyLimit.clear();
                            });
                          },
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
      ),
    );
  }
}
/*
class InputBox extends StatelessWidget {
  final TextEditingController controller;
  int maxlines = 1;
  double height = 40;
  Function onEditingComplete, onChanged;
  final TextInputType keyboardType;
  InputBox(
      {this.onChanged,
      this.onEditingComplete,
      this.maxlines,
      this.height,
      @required this.controller,
      @required this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: height,
        child: TextField(
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          controller: controller,
          maxLines: maxlines,
          keyboardType: keyboardType,
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
    );
  }
}
*/
