import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rxdart/rxdart.dart';

import '../eventbus/eventbus.dart';
import 'login_page.dart';

class LoginController {
  bool isShowingLogin = false;
  static final LoginController _instance = LoginController._internal();
  final stream = new BehaviorSubject<String>();
  static BuildContext? sContext;

  factory LoginController() {
    return _instance;
  }

  LoginController._internal() {
    // 初始化代码
    final debouncedStream = stream.debounceTime(Duration(seconds: 1));
    debouncedStream.listen((message) {
      print("showLogin33");
      print('已限制的发送消息：$message');
      isShowingLogin = true;
      if (sContext != null) {
        showDialog(
            context: sContext!,
            builder: (BuildContext context) {
              return LoginPopup(onLoginSuccess: () {
                Navigator.of(context).pop();
                bus.emit('Login', true);
              });
            });
        print("showLogin44");
      }
      isShowingLogin= false;
    });
  }

  // 触发登陆弹窗
  void showLogin(BuildContext context) {
    print("showLogin11");
    if (isShowingLogin) {
      return;
    }
    print("showLogin22");
    sContext = context;
    stream.add("1111");
  }
}
