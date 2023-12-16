import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {
  static bool hasShow =false;
}

Future<void> errorToShow( msg, {int duration = 1000}) async {
  try {
    if(CommonUtils.hasShow){
      print('拦截了');
      return;
    }
    CommonUtils.hasShow=true;
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff072D8C),
        textColor: Colors.white,
        fontSize: 16.0,
    );
    CommonUtils.hasShow=false;
  } catch (e) {
    print("errorToShow"+msg);
  }
}

Future<void> successToShow(String msg, {int duration = 1000}) async {
  try {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff072D8C),
        textColor: Colors.white,
        fontSize: 16.0,
    );

  } catch (e) {

  }
}

Future<void> toast(String msg, {int duration = 1500}) async {
  try {
    print('执行到这了msg' + msg);
  } catch (e) {
// Handle error
  }
}
