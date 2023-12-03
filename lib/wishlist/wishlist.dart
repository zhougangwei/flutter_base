import 'package:atest/login/login_locale.dart';
import 'package:atest/network/json_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../good/good_page.dart';
import '../network/user.dart';
import '../shop/bean/collect_item_entity.dart';
import '../widget/good_item.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage>
    with AutomaticKeepAliveClientMixin {
  List<CollectItemEntity> wishlishlist = [];
  var datapost = {"page": "1", "limit": "10"};

  @override
  void initState() {
    print('AACCDD执行了WishListPage 1initState');
    var data = this.datapost;
    JsonCacheManager().getJson("wishList").then((value) {
      setState(() {
        wishlishlist =
            jsonConvert.convertListNotNull<CollectItemEntity>(value) ?? [];
      });
    });

    if (LoginStatus.hasLogin()) {
      ApiClient().goodscollectionlist(data).then((res) {
        if (res['status']) {
          setState(() {
            wishlishlist = jsonConvert.convertListNotNull<CollectItemEntity>(
                    res['data']['list']) ??
                [];
            JsonCacheManager().cacheJson("wishList", res['data']['list']);
          });
        }
      }).catchError((err) {
        err.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          var item = wishlishlist[index];
          var it = item.goods;
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: wishlishlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行显示
                childAspectRatio: 335 / 495, // 调整子项的宽高比例
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => goodsinfo(it.id),
                  child: GoodItem(
                    image_url: it.imageUrl,
                    cat_name: "",
                    name: it.name,
                    scoreSum: it.scoreSum,
                    price: it.price,
                    mktprice: it.mktprice,
                  ),
                );
              },
            ),
          );
        },
        childCount: wishlishlist.length,
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

  goodsinfo(id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodPage(goods_id: id)),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;
}
