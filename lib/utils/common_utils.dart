import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {}

Future<void> errorToShow( msg, {int duration = 1000}) async {
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
