import 'package:abce/network/user.dart';
import 'package:abce/shop/bean/cart_bean_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import 'add_address.dart';

class MultiAddress extends StatefulWidget {
  final List<CartBeanList> orderlist;

  const MultiAddress({super.key, required this.orderlist});

  @override
  State<MultiAddress> createState() => _MultiAddressState();
}

class _MultiAddressState extends State<MultiAddress> {
  Map<String, dynamic> datapost = {"is_def": 1};

  @override
  void initState() {
    super.initState();
    this.datapost['is_def'] = 1;
  }

  void showError(String message) {
    // Show error message
  }

  void showSuccess(String message) {
    // Show success message
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Scaffold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          buildGoodCastList(localizations),
        ]));
  }

  SliverList buildGoodCastList(S localizations) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = widget.orderlist[index];
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
                  Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          showAddress(context,item.id);
                        },
                        child: Container(
                            width: 100.w,
                            color: Colors.amber,
                            child: Text(localizations.modifyAddress)),
                      ))
                ],
              ));
        },
        childCount: widget.orderlist?.length ?? 0,
      ),
    );
  }

  void showAddress(BuildContext context,id) async {
    bool confirm = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Add_Address(type: '2',cart_id: id);
        });
    if (confirm == true) {
      Navigator.of(context).pop(true);
    }}
}
