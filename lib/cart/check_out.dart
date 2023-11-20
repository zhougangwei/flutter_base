import 'package:atest/widget/number_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/cart_bean_entity.dart';
import 'add_address.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartBeanList>? cartlist;
  var datapost = {"display": 'all', "ids": ''};

  double totalnumberDouble = 0.0;

  @override
  void initState() {
    var data = this.datapost;
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Scaffold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
              SliverToBoxAdapter(
                  child: obtainWishTilte(context, localizations)),
              SliverToBoxAdapter(
                  child: obtainAddressTilte(context, localizations)),
            ]));
  }

  Container obtainAddressTilte(BuildContext context, S localizations) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(height: 1.0, color: Color(0xff072D8C)),
            GestureDetector(
              onTap: () {
                showAddressDialog(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 90.h,
                color: Color(0xfff8f8f8),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/image/icon-30.png', width: 26.w),
                    Text(localizations.addAddressPS,
                        style: TextStyle(fontSize: 24.sp, color: Colors.black)),
                    Icon(Icons.navigate_next,
                        color: Color(0xff333333), size: 24.w),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showMultiDialog(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 90.h,
                color: Color(0xfff8f8f8),
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/image/icon-31.png', width: 26.w),
                    Text(localizations.multipleAddress,
                        style: TextStyle(fontSize: 24.sp, color: Colors.black)),
                    Icon(Icons.navigate_next,
                        color: Color(0xff333333), size: 24.w),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(localizations.yourOrder,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 36.sp, color: Colors.black)),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(localizations.product,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black)),
                Text(localizations.subttotal,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black)),
              ],
            ),
          ]),
    );
  }

  Column obtainWishTilte(BuildContext context, S localizations) {
    return Column(children: [
      Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: Color(0xfff5f5f5),
        height: ScreenUtil().setHeight(305),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localizations.checkout,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(62), color: Colors.black)),
            ]),
      )
    ]);
  }

  goodsinfo(id) {}

  void showAddressDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Add_Address();
        });
  }

  void showMultiDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '请选择',
                  style: TextStyle(fontSize: 36.sp, color: Colors.black),
                )
              ]);
        });
  }
}
