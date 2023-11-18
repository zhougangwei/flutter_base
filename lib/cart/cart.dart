import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/cart_bean_entity.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartBeanList>? cartlist;
  var datapost = {"page": "1", "limit": "10"};

  var totalnumber;

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
                totalnumber += item.nums * double.parse(item.products.price);
              }
            });
            totalnumber = totalnumber.toStringAsFixed(2);

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
          buildGoodCastList()
        ]));
  }

  SliverList buildGoodCastList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = cartlist?[index];
          if(item==null){
            return Container();
          }
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: cartlist?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // 一行显示
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => goodsinfo(item?.products?.id),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CachedNetworkImage(imageUrl: item.products.imagePath),
                        SizedBox(height: 15),
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
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
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
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        childCount: cartlist?.length??0,
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
              Text(localizations.myWishlish,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(62), color: Colors.black)),
              Text(localizations.HomeMy,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(24), color: Colors.black))
            ]),
      )
    ]);
  }

  goodsinfo(id) {}
}
