import 'package:atest/widget/number_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/cart_bean_entity.dart';

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
    ApiClient().CatoPeration(data).then((res) {
      if (res['status']) {
        setState(() {
          CartBeanEntity? carBean =
              jsonConvert.convert<CartBeanEntity>(res['data']);

          cartlist = carBean?.list;
          cartlist?.forEach((item) {
            if (item != null) {
              item.itemnums = item.nums;
              item.total =
                  (item.nums.toDouble() * double.parse(item.products.price))
                      .toStringAsFixed(2);
              totalnumberDouble +=
                  item.nums * double.parse(item.products.price);
            }
          });
          //totalnumber = totalnumberDouble.toStringAsFixed(2);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Scaffold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
          buildGoodCastList(localizations)
        ]));
  }

  SliverList buildGoodCastList(S localizations) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = cartlist?[index];
          if (item == null) {
            return Container();
          }
          return Container(
            height: 237.h,
            alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CachedNetworkImage(
                      imageUrl: item.products.imagePath,
                      width: 162.w,
                      height: 182.h,
                    ),
                    Container(width: 10.w),
                    Expanded(
                      child: Container(
                        color: Color(0xffF5F5F5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.products.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 27.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(localizations.price),
                                Text(
                                  "\$" +
                                      item.products.price +
                                      "-" +
                                      "\$" +
                                      item.products.mktprice,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(localizations.quantity),
                                NumberBox()
                              ],
                            ),
                            Row(
                              children: [
                                Text(localizations.subtotal),
                                Text(
                                  "\$" +
                                      item.products.price +
                                      "-" +
                                      "\$" +
                                      item.products.mktprice,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ]));
        },
        childCount: cartlist?.length ?? 0,
      ),
    );
  }

  Column obtainWishTilte(BuildContext context, S localizations) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xfff5f5f5),
        height: ScreenUtil().setHeight(305),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localizations.cart,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(62), color: Colors.black)),
            ]),
      )
    ]);
  }

  goodsinfo(id) {}
}
