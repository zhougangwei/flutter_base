import 'package:flutter/material.dart';

class CommonUtils {
  static Future<void> errorToShow(String msg, {int duration = 1500}) async {
    try {

    } catch (e) {
      // Handle error
    }
  }

  static Future<void> successToShow(String msg, {int duration = 1500}) async {
    try {

    } catch (e) {
      // Handle error
    }
  }

  static Future<void> toast(String msg, {int duration = 1500}) async {
    try {
      print('执行到这了msg'+msg);
    } catch (e) {
      // Handle error
    }
  }
}
