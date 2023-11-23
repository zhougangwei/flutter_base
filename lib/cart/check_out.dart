import 'dart:async';

import 'package:atest/widget/number_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/page_controller_provider.dart';
import '../network/user.dart';
import '../shop/bean/cart_bean_entity.dart';
import '../utils/common_utils.dart';
import 'add_address.dart';
import 'multi_address.dart';

class CheckoutPage extends StatefulWidget {
  final String ids;

  CheckoutPage({required this.ids});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartBeanList>? orderlist;
  CartBeanEntity? carBean;
  String couponcode = '';
  var datapost = {"display": 'all', "ids": 1};
  double totalnumberDouble = 0.0;
  String memo = '';
  var defaultship = {};

  @override
  void initState() {
    getuserdefaultship();
    getCatoPeration();
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
              buildGoodCastList(localizations),
              SliverToBoxAdapter(
                  child: obtainTotalMessage(context, localizations)),
              SliverToBoxAdapter(child: obtainBottom(context, localizations)),
            ]));
  }

  SliverList buildGoodCastList(S localizations) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          var item = orderlist?[index];
          if (item == null) {
            return Container();
          }
          return Container(
              alignment: Alignment.centerLeft,
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CachedNetworkImage(
                          imageUrl: item.products.imagePath,
                          width: 162.w,
                          height: 182.h,
                        ),
                        Container(width: 15.w),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 200.w,
                                  child: Text(
                                    item.products.name,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //{{item.nums}}x${{item.products.price}}
                                Text(
                                  item.nums.toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "*\$" + item.products.price.toString(),
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Divider(
                    color: Colors.blueGrey,
                    height: 1.h,
                  ),
                  obtainAddressItem(item)
                ],
              ));
        },
        childCount: orderlist?.length ?? 0,
      ),
    );
  }

  Widget obtainAddressItem(CartBeanList item) {
    return Row(
      children: [
        Image.asset('assets/images/image/icon-30.png', width: 26.w),
        Column(children: [
          Text(
            '${item.address?.firstName}|${item.address?.lastName}'
                '|${item.address?.country}|${item.address?.zipCode}|'
                '${item.address?.code}|${item.address?.mobile}',
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(width: 20.h),
          Text(
            '${item.address?.etc},${item.address?.houseNum},${item.address
                ?.city},${item.address?.state}',
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff333333),
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ],
    );
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

  void delShip(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('删除吗'),
          content: const Text(
            '删除吗',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                var data = {"is_def": 2};
                ApiClient().delShip(data).then((res) {
                  if (res['status']) {
                    getCatoPeration();
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('删除'),
            ),
          ],
        );
      },
    );
  }

  void showMultiDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MultiAddress(orderlist: orderlist ?? []);
        });
  }

  void getCatoPeration() {
    var data = this.datapost;
    data['receipt_type'] = 1;
    data['type'] = 1;
    data['ids'] = widget.ids;
    ApiClient().CatoPeration(data).then((res) {
      if (res['status']) {
        setState(() {
          carBean = jsonConvert.convert<CartBeanEntity>(res['data']);
          orderlist = carBean?.list;
          orderlist?.forEach((item) {
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

  obtainTotalMessage(BuildContext context, S localizations) {
    return Column(children: [
      getItem(localizations.subtotal, "",
          (carBean?.goodsAmount ?? "0.00").toString()),
      getItem(localizations.goodsDiscount, localizations?.discount,
          (carBean?.goodsPmt ?? "0.00").toString()),
      getItem(localizations.orderDiscount, localizations?.discount,
          (carBean?.orderPmt ?? "0.00").toString()),
      getItem(localizations.shipping, "",
          (carBean?.costFreight ?? "0.00").toString()),
      getItem(localizations.total, "", (carBean?.amount ?? "0.00").toString()),
    ]);
  }

  Row getItem(String startText, String? middleText, String endText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(startText),
        Row(
          children: [
            Text(middleText ?? "" + ":"),
            Text("\$" + endText,
                style: TextStyle(
                    fontSize: 24.sp, color: Theme
                    .of(context)
                    .primaryColor)),
          ],
        ),
      ],
    );
  }

  obtainBottom(BuildContext context, S localizations) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(localizations.haveCoupon,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black)),
                GestureDetector(
                  onTap: () {
                    showBottomDialog(
                        localizations.str2, localizations.useCoupon, context);
                  },
                  child: Text(localizations.clickCode,
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Theme
                              .of(context)
                              .primaryColor)),
                ),
              ],
            ),
          ),
          Text(localizations.orderNote,
              style: TextStyle(fontSize: 24.sp, color: Colors.black)),
          TextField(
            style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
            onChanged: (value) {
              memo = value;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
              hintText:
              "Notes about your order, e.g.special notes for delivery",
            ),
          ),
          Divider(
            color: Theme
                .of(context)
                .primaryColor,
            height: 1.h,
          ),
          Column(children: [
            Text(localizations.paymentMethod,
                style: TextStyle(fontSize: 24.sp, color: Colors.black)),
            Row(
              children: [
                Image.asset(
                  'assets/images/image/icon-32.png',
                  height: 52.h,
                ),
                Text(localizations.balancePayment,
                    style: TextStyle(fontSize: 24.sp, color: Colors.black)),
              ],
            ),
            Text(localizations.str1,
                style: TextStyle(fontSize: 24.sp, color: Colors.black)),
            SizedBox(height: 80.h)
          ])
        ]);
  }

  getuserdefaultship() {
    //获取默认地址
    ApiClient().getuserdefaultship(datapost).then((res) {
      if (res['status']) {
        defaultship = res['data'];
      }
    }).catchError((err) {});
  }

  void submit() {
    var data = {
      'area_id': 0,
      'cart_ids': widget.ids,
      'coupon_code': couponcode,
      'memo': this.memo,
      'receipt_type': 1,
      'point': 0,
      'source': 2,
    };

    if (orderlist == null) {
      return;
    }
    bool hasAddress = true;
    for (int i = 0; i < orderlist!.length; i++) {
      CartBeanList item = orderlist![i];
      if (item != null) {
        if (defaultship.isEmpty &&
            (item.address == null || item.address?.id == 0)) {
          hasAddress = false;
          break;
        }
      }
    }
    if (hasAddress == false) {
      errorToShow('Please fill in the address first');
      return;
    }

    ApiClient().createorder(data).then((res) {
      if (res['status']) {
        this.payorder(res['data']["order_id"]);
      } else {
        errorToShow(res['msg']);
      }
    }).catchError((err) {
      err.toString();
    });;
  }

  void payorder(order_id) {
    var data = {
      "ids": widget.ids,
      "payment_code": 'balancepay',
      "payment_type": 1, //1=>订单支付，2=>充值
    };

    ApiClient().payorder(data).then((res) {
      if (res["status"]) {
        successToShow(res['msg']);
        Timer timer = new Timer(Duration(milliseconds: 1000), (){
          Provider.of<PageControllerProvider>(context, listen: false).goToPage(3);
        });
      }
    }).catchError((err) {
      err.toString();
      if (err.status == false) {
        successToShow(err.msg);
      }
      Timer timer = new Timer(Duration(milliseconds: 1000), (){
            Provider.of<PageControllerProvider>(context, listen: false).goToPage(3);
      });
    });

  }


void showBottomDialog(String title, String sub, BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
            Container(
              child: TextField(
                style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                onChanged: (value) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xff333333), width: 1.0)),
                  hintText: "Coupon code",
                ),
              ),
            ),
            SizedBox(height: 50.h),
            Container(
              height: 80.h,
              alignment: Alignment.center,
              color: Theme
                  .of(context)
                  .primaryColor,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(sub, style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    },
  );
}}
