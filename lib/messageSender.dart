import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

onBackgroundMessage(SmsMessage message) {
  debugPrint('onBackgroundMessage called');
}

class SendMessage extends StatefulWidget {
  @override
  _SendMessage createState() => _SendMessage();
}

class _SendMessage extends State<SendMessage> {
  final telephony = Telephony.instance;
  String _message;
  Timer timer;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    timer = Timer.periodic(Duration(seconds: 15), (Timer t) => sendMessage());
  }
  sendMessage() async {
              await telephony.sendSms(
                to: '9125728107',
                message: 'Hello',
              );}
  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body;
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? 'sent' : 'delivered';
    });
  }

  Future<void> initPlatformState() async {
    final bool result = await telephony.requestPhoneAndSmsPermissions;
    if (result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Send Message to 9125728107',
            ),
          ),
          // FlatButton(
          //   onPressed: sendMessage(),
          //   child: Text(
          //     'Send Message',
          //   ),
          // ),
        ],
      ),
    );
  }
}
