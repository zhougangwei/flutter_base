import 'package:abce/login/login_locale.dart';
import 'package:abce/utils/common_utils.dart';
import 'package:abce/widget/number_box.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../eventbus/eventbus.dart';
import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/cart_bean_entity.dart';
import 'check_out.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  _CartPageState createState() => _CartPageState();
}

typedef void EventCallback(arg);

class _CartPageState extends State<CartPage>
    with AutomaticKeepAliveClientMixin {
  List<CartBeanList>? cartlist;
  var datapost = {"display": 'all', "ids": ''};

  double totalnumberDouble = 0.0;

  @override
  void initState() {
    print('AACCDD执行了CartPage 1initState');
    gotoLogin();
    bus.on("Login", afterLogin);
    super.initState();
  }

  void afterLogin(arg) {
    gotoLogin();
  }

  void gotoLogin() {

    print('AACCDD还没登陆');
    getCatoPeration();
    if (!LoginStatus.hasLogin()) {}
  }

  dispose() {
    print('AACCDD执行了CartPage 2dispose');
    super.dispose();
    bus.off('Login', afterLogin);
  }

  void getCatoPeration() {
    var data = this.datapost;
    ApiClient().CatoPeration(data).then((res) {
      if (res['status']) {
          CartBeanEntity? carBean =
              jsonConvert.convert<CartBeanEntity>(res['data']);
          cartlist = carBean?.list;
          refreshTotalNum();
          setState(() {
          });
          //totalnumber = totalnumberDouble.toStringAsFixed(2);
      } else {
        if (res['data'] == 14007 || res['data'] == 14006) {}
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void refreshTotalNum() {
    this.totalnumberDouble = 0.0;

    if(cartlist!=null){
      for (var i = 0; i < cartlist!.length; i++) {
        CartBeanList item = cartlist![i];
        item.itemnums = item.nums;
        item.total = (item.nums.toDouble() * double.parse(item.products.price))
            .toStringAsFixed(2);
        totalnumberDouble += item.nums * double.parse(item.products.price);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var localizations = S.of(context);
    return Scaffold(body: Container(child: Builder(builder: (context) {
      return Stack(
        children: [
          Builder(builder: (context) {
            if (cartlist == null || cartlist?.length == 0) {
              return Column(
                children: [
                  obtainWishTilte(localizations),
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 200.h),
                          Icon(Icons.hourglass_empty,
                              color: Color(0x33333333), size: 150.w),
                          SizedBox(height: 30.h),
                          Text("Shopping cart is empty",
                              style: TextStyle(
                                  color: Color(0x33333333), fontSize: 24.sp))
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return CustomScrollView(
                  physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
                  slivers: [
                    SliverToBoxAdapter(child: obtainWishTilte(localizations)),
                    buildGoodCastList(localizations),
                    SliverToBoxAdapter(child: obtainWishBottom(localizations)),
                    SliverToBoxAdapter(child: Container(height: 150.h)),
                  ]);
            }
          }),
          Positioned(
              right: 0,
              left: 0,
              bottom: 1.h,
              child: GestureDetector(
                onTap: () {
                  String ids = '';
                  cartlist?.forEach((item) {
                    if (ids != '') {
                      ids += ',';
                    }
                    ids += item.id.toString();
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CheckoutPage(ids: ids)));
                },
                child: Container(
                  height: 100.h,
                  color: Color(0xffFB641B), // 自定义头部的背景颜色
                  child: Center(
                    child: Text(
                      localizations.proceedCheckout,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      );
    })));
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
                        Container(width: 25.w),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.products.name,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 28.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        catdel(item.id, index);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                            'assets/images/image/icon-28.png',
                                            width: 30.w),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizations.price,
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 24.sp,
                                        )),
                                    Text(
                                      "\$" +
                                          item.products.price ,

                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizations.quantity,
                                        style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 24.sp,
                                        )),
                                    NumberBox(
                                      defaultValue: item?.itemnums??1 ,
                                      onChange: (int nums) {
                                        unmchange(item.id, nums);
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(localizations.subtotal),
                                    Text(
                                      "\$" +
                                          item.total,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ),
                        ),
                      ]),
                  Divider(
                    color: Color(0x33333333),
                    height: 1.h,
                  )
                ],
              ));
        },
        childCount: cartlist?.length ?? 0,
      ),
    );
  }

  Column obtainWishTilte(S localizations) {
    return Column(children: [
      Container(
        width: double.infinity,
        color: Color(0xfff5f5f5),
        height: ScreenUtil().setHeight(305),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(localizations.cart,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(62),
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ]),
      )
    ]);
  }

  goodsinfo(id) {}

  obtainWishBottom(S localizations) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.h),
          Text(
            "CART TOTALS",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 36.sp,
            ),
          ),
          SizedBox(height: 20.h),
          Divider(
            color: Color(0x33333333),
            height: 1.h,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                localizations.total,
                style: TextStyle(fontSize: 28.sp),
              ),
              Text(
                "\$${totalnumberDouble.toStringAsFixed(2)}",
                style: TextStyle(
                    fontSize: 36.sp, color: Theme.of(context).primaryColor),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;

  void unmchange(int id, int nums) {
    Map<String, dynamic> data = {"nums": nums, "id": id};
    ApiClient().setnums(data).then((value) {
      if (value['status']) {
        gotoLogin();
      } else {
        errorToShow(value['msg']);
      }
    }).catchError((e) {
      print(e);
    });
  }

  void catdel(int id, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Point'),
          content: Text('Are you sure want to delete?'),
          actions: [
            TextButton(
              onPressed: () {
                // 取消退出登陆
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            TextButton(
              onPressed: () {
                // 确认退出登陆
                Navigator.of(context).pop();
                ApiClient().catdel({'ids': id}).then((res) {
                  setState(() {
                    if (res['status']) {
                      cartlist?.removeAt(index);
                    }
                    refreshTotalNum();
                  });
                }).catchError((err) {
                  err.toString();
                });
              },
              child: Text(
                'Confirm',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
