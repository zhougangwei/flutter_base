import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CommonUtils {}

Future<void> errorToShow( msg, {int duration = 1500}) async {
  try {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  } catch (e) {
    print("errorToShow"+msg);
  }
}

Future<void> successToShow(String msg, {int duration = 1500}) async {
  try {} catch (e) {
// Handle error
  }
}

Future<void> toast(String msg, {int duration = 1500}) async {
  try {
    print('执行到这了msg' + msg);
  } catch (e) {
// Handle error
  }
}
