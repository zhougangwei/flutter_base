import 'package:atest/good/good_foot.dart';
import 'package:atest/login/login_locale.dart';
import 'package:atest/shop/home_banner.dart';
import 'package:atest/widget/custom_scaffoldr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/page_controller_provider.dart';
import '../network/user.dart';
import '../shop/bean/promotion_bean_entity.dart';
import '../widget/carousel.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage>
    with AutomaticKeepAliveClientMixin {
  List<PromotionBeanList> promotionList = [];
  var datapost = {"page": "1", "limit": "10"};

  @override
  void initState() {
    print('AACCDD执行了ActivityPage 1initState');

    var data = this.datapost;
    ApiClient().getPromotionType(data).then((res) {
      if (res['status']) {
        setState(() {
          promotionList =
              jsonConvert.convert<PromotionBeanEntity>(res['data'])?.list??[];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var localizations = S.of(context);
    return CustomScafflold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
          buildGoodCastList(),
          SliverToBoxAdapter(child: GoodFoot()),
        ]));
  }

  SliverList buildGoodCastList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var fatherItem = promotionList[index];
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child:  Column(
              children: [
                CachedNetworkImage(imageUrl: fatherItem.image,height: 348.h,),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: fatherItem.child.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 一行显示
                    childAspectRatio: 335 / 475, // 调整子项的宽高比例
                    crossAxisSpacing: 10, // 子项之间的横向间距
                    mainAxisSpacing: 10, // 两个子项
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    var item = fatherItem.child[index];
                    return GestureDetector(
                      onTap: () {
                        goodsinfo(item.id);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CachedNetworkImage(imageUrl: item.imageUrl),
                              Text(
                                item.catName,
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
                                  item.name,
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '\$${item.price}-\$${item.mktprice}',
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
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        childCount: promotionList.length,
      ),
    );
  }

  Column obtainWishTilte(BuildContext context, S localizations) {
    return Column(children: [
      Container(
        width: double.infinity,
        color: Color(0xfff5f5f5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              Text(localizations.activities,
                  style: TextStyle(
                      fontSize: 62.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text(localizations.homeThemaActive,
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 45.h),
            ]),
      )
    ]);
  }

  goodsinfo(id) {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
