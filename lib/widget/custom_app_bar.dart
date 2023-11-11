import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../language/current_locale.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey ;
  CustomAppBar({required this.scaffoldKey});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff072D8C),
        actions: <Widget>[
          Row(
            children: [
              getCountry(context),
              SizedBox(width: 28.w),
              GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Image.asset('assets/images/image/icon-1.png',
                      width: 37.w)),
              SizedBox(width: 28.w),
              GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Image.asset('assets/images/image/icon-2.png',
                      width: 37.w)),
              SizedBox(width: 28.w),
              GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                  child: Image.asset('assets/images/image/icon-3.png',
                      width: 37.w)),
              SizedBox(width: 34.w),
            ],
          ),
        ],
        leadingWidth: 150,
        leading: Container(
          width: 120,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // 图片点击后执行的代码
                  scaffoldKey.currentState?.openDrawer();
                },
                child: Container(
                    padding: EdgeInsets.only(left: 30.w, right: 10.w),
                    child: Icon(Icons.menu, color: Colors.white)),
              ),
              Image.asset('assets/images/image/icon-logo.png', width: 113.w),
            ],
          ),
        ));
  }

  Widget getCountry(BuildContext context) {
    var currentCountryCode =
        Provider.of<CurrentLocale>(context).getCurrentCountryCodeImgCode();
    return GestureDetector(
        onTap: () {
          scaffoldKey.currentState?.openEndDrawer();
        },
        child: Image.asset('assets/images/image/${currentCountryCode}.png',
            width: 37.w));
  }
}
