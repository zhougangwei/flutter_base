import 'package:abce/network/json_cache_manager.dart';
import 'package:abce/shop/bean/orderinfobean_entity.dart';
import 'package:abce/widget/custom_scaffoldr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../good/good_page.dart';
import '../network/user.dart';
import '../shop/bean/collect_item_entity.dart';
import '../utils/common_utils.dart';
import '../widget/good_item.dart';

class OrderInfoPage extends StatefulWidget {
  final String ids;

  const OrderInfoPage({super.key, required this.ids});

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  OrderinfobeanEntity? orderInfo;

  List<OrderinfobeanItems>? orderlist;

  @override
  void initState() {
    getOrderInfo();
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return CustomScafflold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
          SliverToBoxAdapter(
              child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 30.h, left: 20.w, bottom: 30.h),
                  child: Text(localizations.yourOrder))),
          buildGoodCastList(localizations),
          SliverToBoxAdapter(child: obtainTotalMessage(context, localizations)),
        ]));
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
              Text(localizations.orderDetails,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(62), color: Colors.black)),
            ]),
      )
    ]);
  }

  goodsinfo(id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodPage(goods_id: id)),
    );
  }

  void getOrderInfo() {
    ApiClient().orderdetails({"order_id": widget.ids}).then((res) {
      if (res['status']) {
        setState(() {
          orderInfo = jsonConvert.convert<OrderinfobeanEntity>(res['data']);
          orderlist = orderInfo?.items;
        });
      }
    }).catchError((err) {});
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
              color: Colors.white,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Column(
                children: [
                  obtainAddressItem(item),
                  Container(
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CachedNetworkImage(
                            imageUrl: item.imageUrl,
                            width: 162.w,
                            height: 182.h,
                          ),
                          Expanded(
                            child: Container(
                              width: 200.w,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xff333333),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Container(
                                    padding: EdgeInsets.all(5.w),
                                    color: Color(0x33999999),
                                    child: Text(
                                      item.addon,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
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
                                  "*\$" + item.price.toString(),
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
                        ]),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Divider(
                      color: Color(0x11999999),
                      height: 1.h,
                    ),
                  ),
                ],
              ));
        },
        childCount: orderlist?.length ?? 0,
      ),
    );
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

  obtainTotalMessage(BuildContext context, S localizations) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(children: [
        SizedBox(height: 10.h),
        getItem(localizations.subtotal, "",
            (orderInfo?.goodsAmount ?? "0.00").toString()),
        SizedBox(height: 20.h),
        Divider(
          height: 1,
          color: Color(0x33999999),
        ),
        SizedBox(height: 20.h),
        getItem(localizations.OrderNumber, "",
            (orderInfo?.orderId ?? "0.00").toString()),
        SizedBox(height: 20.h),
        Divider(
          height: 1,
          color: Color(0x33999999),
        ),
        SizedBox(height: 20.h),
        getItem(localizations.orderTime, "",
            (orderInfo?.ctime ?? "0.00").toString()),
        SizedBox(height: 20.h),
        Divider(
          height: 1,
          color: Color(0x33999999),
        ),
      ]),
    );
  }

  Widget obtainAddressItem(OrderinfobeanItems item) {
    return Container(
      margin: EdgeInsets.only(right: 25.h, left: 25.w),
      color: Color(0x11999999),
      padding: EdgeInsets.all(20.h),
      child: Row(
        children: [
          Image.asset('assets/images/image/icon-30.png', width: 26.w),
          SizedBox(width: 10.w),
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.firstName}|${item.lastName}'
                  '|${item.country}|${item.zipCode}|'
                  '${item.code}|${item.mobile}',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(width: 30.h),
                Text(
                  '${item?.etc},${item?.houseNum},${item?.city},${item?.state}',
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff333333),
                    fontSize: 24.sp,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
