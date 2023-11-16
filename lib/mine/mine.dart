import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/login_locale.dart';
import '../network/user.dart';
import '../shop/bean/user_info_entity.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  UserInfoEntity? userinfo;

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginStatus>(context);
    final localizations = S.of(context);
    return Consumer<LoginStatus>(
      builder: (context, loginstatus, _) {
        getuserinfo();
        return DefaultTabController(
            length: 3, // 选项卡的数量
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(550.h),
                child: AppBar(
                  flexibleSpace: Container(
                      height: 421.h,
                      alignment: Alignment.center,
                      color: Color(0xffE8EBFC),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 33.h),
                          if(userinfo != null)
                            CachedNetworkImage(
                              imageUrl: userinfo!.avatar,
                              width: 188.w,
                              height: 188.h,
                              fit: BoxFit.cover,
                            )
                           else
                            Container(
                              width: 188.w,
                              height: 188.h,
                            )
                          ,
                          SizedBox(height: 14.h),
                          if(userinfo != null)
                            Text(userinfo!.nickname,
                              style: TextStyle(
                                  color: Color(0xff333333), fontSize: 32.sp)),
                          SizedBox(height: 33.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text("\$"+(userinfo?.balance??"0.0"),
                                        style: TextStyle(
                                            color: Color(0xffFB641B),
                                            fontSize: 36.sp))

                                    , Text(localizations.balance,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp))
                                  ],
                                ), Column(
                                  children: [
                                    Text((userinfo?.wishlist??0).toString(),
                                        style: TextStyle(
                                            color: Color(0xffFB641B),
                                            fontSize: 36.sp))

                                    , Text(localizations.wishlist,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp))
                                  ],
                                ), Column(
                                  children: [
                                    Text((userinfo?.cart??0).toString(),
                                        style: TextStyle(
                                            color: Color(0xffFB641B),
                                            fontSize: 36.sp))

                                    , Text(localizations.cart,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp))
                                  ],
                                )
                              ])
                        ],
                      )),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(100.h),
                    child: TabBar(
                      tabs: [
                        Tab(text: 'Tab 1'),
                        Tab(text: 'Tab 2'),
                        Tab(text: 'Tab 3'),
                      ],
                    ),
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  Center(child: Text('Content for Tab 1')),
                  Center(child: Text('Content for Tab 2')),
                  Center(child: Text('Content for Tab 3')),
                ],
              ),
            ));
      }
    );
  }


  editavatar(data) {
    //修改头像
    ApiClient().changeavatar({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert
              .convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  editinfo() {
    //修改个人信息
    ApiClient().editinfo({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert
              .convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }



  getbalancelist() {
    //充值记录
    ApiClient().getbalancelist({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert
              .convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  getuserinfo() {
    ApiClient().getuserinfo({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert
              .convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }
}
