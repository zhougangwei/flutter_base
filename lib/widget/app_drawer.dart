import 'package:atest/sp/sp_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../home/faq.dart';
import '../login/login_locale.dart';
import '../login/login_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginStatus>(context);
    final localizations = S.of(context);
    return Consumer<LoginStatus>(builder: (context, loginstatus, _) {
      return Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(height: 116.h, color: Color(0xff0E39A4)),
            if (!loginstatus.hasLogin())
              Container(
                child: GestureDetector(
                  onTap: () {
                    if (!loginProvider.hasLogin()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoginPopup(
                            onPressed: () {
                              loginProvider.setLoginStatus("1");
                              Navigator.of(context).pop();
                            },
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 100.h,
                    color: Color(0xff0E39A4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 30.w),
                        Image.asset('assets/images/image/icon-3.png',
                            width: 30.w),
                        SizedBox(width: 8.w),
                        Text(localizations.loginSigup,
                            style: TextStyle(
                                fontSize: 28.sp, color: Colors.white)),
                        Expanded(child: Container()),
                        Icon(Icons.keyboard_arrow_right,
                            size: 20, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
            Container(
              height: 100.h,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    child: Text(localizations.mend,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28.sp, color: Color(0xff072D8C))),
                  )),
                  Expanded(
                      child: Container(
                    color: Color(0xfff8f8f8),
                    child: Text(localizations.categories,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28.sp, color: Color(0xff333333))),
                  ))
                ],
              ),
            ),
            buildGestureDetector(localizations.home, true,
                ontap: () => {Navigator.of(context).pop()}),
            buildGestureDetector(localizations.activities, false,
                ontap: () => {Navigator.of(context).pop()}),
            buildGestureDetector(localizations.voucheer, true,
                ontap: () => {Navigator.of(context).pop()}),
            buildGestureDetector(localizations.faq, false, ontap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FaqPage()));
            }),
            buildGestureDetector(localizations.contactUs, false,
                ontap: () => {Navigator.of(context).pop()}),
          ],
        ),
      );
    });
  }

  Container buildGestureDetector(String home, bool hasAdd,
      {required Function() ontap}) {
    return Container(
      height: 91.h,
      child: GestureDetector(
          child: Row(
            children: [
              SizedBox(width: 30.w),
              Text(home,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.sp, color: Color(0xff333333))),
              Expanded(child: Container()),
              getAdd(hasAdd),
              SizedBox(width: 42.w),
            ],
          ),
          onTap: () => ontap()),
    );
  }

  getAdd(bool hasAdd) {
    if (hasAdd) {
      return Icon(Icons.add, size: 25.w, color: Color(0xff333333));
    } else {
      return Container();
    }
  }
}
