import 'package:abce/home/contact_us.dart';
import 'package:abce/login/h5_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../eventbus/eventbus.dart';
import '../generated/l10n.dart';
import '../home/activity.dart';
import '../home/faq.dart';
import '../home/voucher.dart';
import '../login/login_locale.dart';
import '../login/login_page.dart';
import '../login/page_controller_provider.dart';

class AppDrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppDrawerWidget({required this.scaffoldKey});

  @override
  _AppDrawerWidgetState createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  void initState() {
    print("Appdrawer" + "init");
    bus.on("Login", loginState);
    super.initState();
  }

  void loginState(arg) {
    print('AACCDD执行了_AppDrawerWidgetState initState');
    setState(() {});
  }

  @override
  void dispose() {
    print("Appdrawer" + "dispose");
    // TODO: implement dispose
    bus.off("Login", loginState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(height: 116.h, color: Color(0xff0E39A4)),
          if (!LoginStatus.hasLogin())
            Container(
              child: GestureDetector(
                onTap: () {
                  if (!LoginStatus.hasLogin()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext scontext) {
                        return LoginPopup(
                          onLoginSuccess: () {
                            widget.scaffoldKey.currentState?.closeDrawer();
                            Navigator.of(context).pop();
                            bus.emit('Login', true);
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
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white)),
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
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Container(
                  alignment: Alignment.center,
                  height: 100.h,
                  child: Text(localizations.mend,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 28.sp, color: Color(0xff072D8C))),
                ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      child: Container(
                  alignment: Alignment.center,
                  height: 100.h,
                  color: Color(0xfff8f8f8),
                  child: Text(localizations.categories,
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 28.sp, color: Color(0xff333333))),
                ),
                    ))
              ],
            ),
          ),
          buildGestureDetector(localizations.home, true, ontap: () {
            Navigator.of(context).pop();
            Navigator.of(context).popUntil((route) => route.isFirst);
            Provider.of<PageControllerProvider>(context, listen: false)
                .goToPage(0);
          }),
          buildGestureDetector(localizations.activities, false, ontap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ActivityPage()));
          }),
          buildGestureDetector(localizations.voucheer, true, ontap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => VoucherPage()));
          }),
          buildGestureDetector(localizations.faq, false, ontap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FaqPage()));
          }),
          buildGestureDetector(localizations.contactUs, false, ontap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ContactUsPage()));
          }),
          buildGestureDetector('Privacy Policy', false, ontap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) =>H5Page(title:'Privacy Policy',url:'https://abce-commerce.com/#/pages/H5/other/ysxy')));
          }),
        ],
      ),
    );
  }

  Widget buildGestureDetector(String home, bool hasAdd,
      {required Function() ontap}) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Container(
        color: Color(0x01333333),
        height: 91.h,
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
      ),
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
