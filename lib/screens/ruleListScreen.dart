import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addRule.dart';
import 'package:sms_forwarder/ruleClass.dart';
import '../style.dart';

class RuleListScreen extends StatefulWidget {
  @override
  _RuleListScreenState createState() => _RuleListScreenState();
}

class _RuleListScreenState extends State<RuleListScreen> {
  RuleCollection collection;

  @override
  void initState() {
    super.initState();
    collection = RuleCollection();
  }

  @override
  Widget build(BuildContext context) {
    // Rule gt = Rule();
    // Rule et = Rule();
    // gt.ruleName = 'asd';
    // gt.forwardFrom = ['88897', '66777'];
    // collection.rules.add(gt);
    // et.ruleName = 'qwed';
    // et.forwardTo.add('value');
    // collection.rules.add(et);
    // collection.rules.add(gt);

    return Scaffold(
      backgroundColor: kThemebgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30),
            child: Column(
              children: [
                Text(
                  'RULE LIST',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: buildListView(context),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Rule rule = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddRule();
            }),
          );
          if (rule != null) {
            setState(() {
              collection.rules.add(rule);
            });
            print(collection.rules.length);
            print(rule.dailyLimit);
          } else
            print('hhhh');
        },
        backgroundColor: kThemebgColor,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    if (collection.rules.length == 0)
      return Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 66,
            ),
            Text(
              'No Rules!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('Click + icon to add rule'),
          ],
        ),
      );
    List<Widget> ruleCards;
    ruleCards = List<Widget>.generate(collection.rules.length, (index) {
      return GestureDetector(
        onDoubleTap: () async {
          Rule rule = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return AddRule(
                rule: collection.rules[index],
              );
            }),
          );
          collection.rules[index] = rule;
          print(collection.rules[index].ruleName);
        },
        child: Card(
          elevation: 3,
          color: Colors.greenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(collection.rules[index].ruleName),
                Row(
                  children: [
                    Text(
                      'From:',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    Row(
                      children: [
                        Text(
                          'From:',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          'From:',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'To:',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
    ruleCards.insert(
        0,
        SizedBox(
          height: 30,
        ));
    return ListView(
      children: ruleCards,
    );
  }
}
/*
ListView(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onDoubleTap: () {
                      print('open');
                    },
                    child: Card(
                      elevation: 3,
                      color: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Rule Name'),
                            Row(
                              children: [
                                Text(
                                  'From:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'To:',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
*/
