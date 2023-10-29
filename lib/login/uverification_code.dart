import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../sp/sp_utils.dart';

class UVerificationCode extends StatefulWidget {
  UVerificationCode({
    Key? key,
  }) : super(key: key);

  @override
  UVerificationCodeState createState() => UVerificationCodeState();
}

class UVerificationCodeState extends State<UVerificationCode> {
  int secNum = 0;
  Timer? timer;
  bool canGetCode = true;
  int seconds = 60;
  String startText = 'Send Code';
  String changeText = 'Xsecond';
  String endText = 'Reacquire';
  bool keepRunning = false;
  String uniqueKey = '';
  String showText = '';

  @override
  void initState() {
    super.initState();
    checkKeepRunning();
  }

  @override
  void dispose() {
    super.dispose();
    setTimeToStorage();
    timer?.cancel();
  }

  void checkKeepRunning() async {
    var string = await SharedPreferencesUtils.getString(
        uniqueKey + '_uCountDownTimestamp');
    final lastTimestamp = int.tryParse(string);
    if (lastTimestamp == null) {
      changeEvent(startText);
      return;
    }

    final nowTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    if (keepRunning && lastTimestamp > nowTimestamp) {
      secNum = lastTimestamp - nowTimestamp;
      SharedPreferencesUtils.remove(uniqueKey + '_uCountDownTimestamp');
      start();
    } else {
      changeEvent(startText);
    }
  }

  void start() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
    print('执行到这了start11'+secNum.toString());
    canGetCode = false;
    changeEvent(changeText.replaceFirst(RegExp(r'x|X'), secNum.toString()));
    setTimeToStorage();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (--secNum > 0) {
        changeEvent(changeText.replaceFirst(RegExp(r'x|X'), secNum.toString()));
      } else {
        timer.cancel();
        print('执行到这了start'+secNum.toString());
        changeEvent(endText);
        secNum = seconds;
        canGetCode = true;
      }
    });
  }

  void reset() {
    canGetCode = true;
    timer?.cancel();
    secNum = seconds;
    print('执行到这了reset');
    changeEvent(endText);
  }

  void changeEvent(String text) {
    setState(() {
      showText = text;
    });
  }

  void setTimeToStorage() {
    if (!keepRunning || timer == null) return;

    if (secNum > 0 && secNum <= seconds) {
      final nowTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      SharedPreferencesUtils.setString(
        uniqueKey + '_uCountDownTimestamp',
        (nowTimestamp + secNum).toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text('$showText');
  }
}
