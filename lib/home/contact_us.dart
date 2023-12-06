import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/good/good_foot.dart';
import 'package:abce/widget/custom_scaffoldr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/setting_bean_entity.dart';
import '../widget/app_drawer.dart';
import '../widget/custom_app_bar.dart';

class ContactUsPage extends StatefulWidget {
  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage>
    with AutomaticKeepAliveClientMixin {
  SettingBeanEntity? footData;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: AppDrawerWidget(scaffoldKey: _scaffoldKey),
      body: CustomScrollView(
          primary: true,
          physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
          slivers: [
            SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
            SliverToBoxAdapter(child: obtainWishBody(context, localizations)),
            SliverToBoxAdapter(
                child: GoodFoot(onGetFoot: (SettingBeanEntity foot) {
              footData = foot;
            })),
          ]),
    );
  }

  Column obtainWishTilte(BuildContext context, S localizations) {
    return Column(children: [
      Container(
        width: double.infinity,
        color: Color(0xfff5f5f5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              Text(localizations.contactUs,
                  style: TextStyle(
                      fontSize: 62.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text(localizations.homeContact,
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 45.h),
            ]),
      )
    ]);
  }

  @override
  void initState() {
    getfaqlist();
    super.initState();
  }

  FocusNode _textFieldFocusNode = FocusNode();

  void getfaqlist() {
    ApiClient().getfaqlist({}).then((res) {
      if (res['status']) {}
    }).catchError((err) {
      err.toString();
    });
  }

  obtainWishBody(BuildContext context, S localizations) {
    return Column(children: [
      Container(
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(30.w),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.sendMessage,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.ContactUs,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.yourName,
                    style: TextStyle(fontSize: 28.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 80.h,
                    child: FocusScope(
                      child: TextField(
                        style: TextStyle(
                            fontSize: 24.sp, color: Color(0xff666666)),
                        onChanged: (value) {},
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.r),
                                borderSide:
                                    BorderSide(color: Color(0x33666666))),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.yourEmail,
                    style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 80.h,
                    child: TextField(
                      focusNode: _textFieldFocusNode,
                      style:
                          TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.r),
                              borderSide: BorderSide(color: Color(0x33666666))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.subject,
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 80.h,
                    child: TextField(
                      style:
                          TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.r),
                              borderSide: BorderSide(color: Color(0x33666666))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.yourMessage,
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 238.h,
                    child: TextField(
                      maxLines: 6,
                      style:
                          TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.r),
                              borderSide: BorderSide(color: Color(0x33666666))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0)),
                    ),
                  ),
                  Container(
                    height: 80.h,
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    width: double.infinity,
                    child: Text(
                      localizations.submit,
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.getTouch,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.str3,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.str4,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.str5,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.ourOffice,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-24.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.Address + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.officeAddress ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-25.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.phone + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.officePhone ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-26.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.email + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.officeEmail ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    localizations.workHours,
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-27.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.email + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.office1 ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-27.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.email + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.office2 ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image/icon-27.png',
                        width: 24.w,
                      ),
                      SizedBox(width: 17.w),
                      Text(
                        localizations.email + ":",
                        style: TextStyle(fontSize: 24.sp, color: Colors.black),
                      ),
                      SizedBox(width: 17.w),
                      Text(footData?.office3 ?? '',
                          style:
                              TextStyle(fontSize: 24.sp, color: Colors.black)),
                    ],
                  ),
                ]),
          ))
    ]);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
