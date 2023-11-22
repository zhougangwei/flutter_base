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
import 'multi_address.dart';

class CheckoutPage extends StatefulWidget {
  final String ids;

  CheckoutPage({required this.ids});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<CartBeanList>? cartlist;
  CartBeanEntity? carBean;
  var datapost = {"display": 'all', "ids": 1};

  double totalnumberDouble = 0.0;

  @override
  void initState() {
    getCatoPeration();
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Scaffold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
          SliverToBoxAdapter(child: obtainAddressTilte(context, localizations)),
          buildGoodCastList(localizations),
          SliverToBoxAdapter(child: obtainTotalMessage(context, localizations)),
          SliverToBoxAdapter(child: obtainBottom(context, localizations)),
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
        childCount: cartlist?.length ?? 0,
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
            '${item.address?.etc},${item.address?.houseNum},${item.address?.city},${item.address?.state}',
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
        width: MediaQuery.of(context).size.width,
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
          return MultiAddress(cartlist: cartlist ?? []);
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
                    fontSize: 24.sp, color: Theme.of(context).primaryColor)),
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
                    showBottomDialog(context);
                  },
                  child: Text(localizations.clickCode,
                      style: TextStyle(
                          fontSize: 24.sp,
                          color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ),
          Text(localizations.orderNote),
          TextField(
            style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
            onChanged: (value) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff333333), width: 1.0)),
              hintText:
                  "Notes about your order, e.g.special notes for delivery",
            ),
          )
        ]);
  }

  void showBottomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('优惠券'),
          content: const Text(
            '优惠券',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }
}
