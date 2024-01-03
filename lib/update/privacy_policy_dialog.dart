import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../login/h5_page.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  PrivacyPolicyDialog({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Privacy Policy'),
      content: SingleChildScrollView(
        child: Text.rich(TextSpan(
          text: 'Your privacy is important to us. This ',
          style: TextStyle(fontSize: 16.0),
          children: <TextSpan>[
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // 处理点击事件，例如导航到隐私政策页面
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>H5Page(title:'Privacy Policy',url:'https://abce-commerce.com/#/pages/H5/other/ysxy')));
                },
            ),
            TextSpan(
                text:
                    ' explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this Privacy Policy carefully. By using the application, you consent to our collection, use, and disclosure of your information as described in this Privacy Policy.'),
          ],
        )),
      ),
      actions: <Widget>[
        GestureDetector(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              color: Theme.of(context).primaryColor,
              child: Text('Decline',
                  style: TextStyle(color: Colors.white, fontSize: 16.0))),
          onTap: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
        ),
        GestureDetector(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                color: Theme.of(context).primaryColor,
                child: Text('Accept',
                    style: TextStyle(color: Colors.white, fontSize: 16.0))),
            onTap: () {
              onConfirm();
              Navigator.of(context).pop();
            }),
      ],
    );
  }
}
