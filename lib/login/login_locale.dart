import 'package:atest/sp/sp_utils.dart';
import 'package:flutter/material.dart';

class LoginStatus with ChangeNotifier {

  String loginStatus = "0";
  String oldLoginStatus = "0";

  String get value => loginStatus;

  void setLoginStatus(status) {
    this.oldLoginStatus = this.loginStatus;
    this.loginStatus = status;
    notifyListeners();
  }

  bool hasChanged(){
    return oldLoginStatus!= loginStatus;
  }

  bool hasLogin(){
    return SPUtils.getString("token")!="";
  }
}
