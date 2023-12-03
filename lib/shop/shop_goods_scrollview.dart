import 'dart:convert';

import 'package:atest/shop/bean/page_bean_entity.dart';
import 'package:atest/widget/rounded_searchbar.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classify/classify_page.dart';
import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../good/good_page.dart';
import '../network/json_cache_manager.dart';
import '../network/user.dart';
import '../widget/dynamic_width_divider.dart';
import '../widget/good_item.dart';
import '../widget/rating_widget.dart';
import 'bean/feature_entity.dart';
import 'bean/good_cat_bean_entity.dart';
import 'bean/type_item_entity.dart';
import 'home_banner.dart';

class ShopGoodsScrollView extends StatefulWidget {
  const ShopGoodsScrollView({super.key});

  @override
  _ShopGoodsScrollViewState createState() => _ShopGoodsScrollViewState();
}

class _ShopGoodsScrollViewState extends State<ShopGoodsScrollView>
    with AutomaticKeepAliveClientMixin {
  List<GoodCatBeanEntity> getGoodsCatlist = [];
  List<TypeItemEntity> typeList = [];
  List<FeatureEntity> featurednlist = [];
  var datapost = {"page": "1", "limit": "4"};

  List<PageBeanEntity> pageList = [];

  String keyworde = "";

  @override
  void initState() {
    super.initState();
    print('加载initState');
    getTypeList();
    relatedList();
    getGoodsCat();
    getPageList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final localizations = S.of(context);
    return Scaffold(
        body: CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [
        SliverToBoxAdapter(child: RoundedSearchBar(
          onKeyword: (String word) {
            this.keyworde = word;
            seachgoods('ALL GOODS');
          },
        )),
        SliverToBoxAdapter(child: HomeCarouselBanner(from: 'tpl1_slider')),
        buildTypeList(),
        buildFeatured(localizations),
        buildGoodCastList(),
        buildPageList(),

        SliverToBoxAdapter(child: Column(
          children: [
            Divider(
              color: Color(0x33999999),
              thickness: 2.h,
            ),
            SizedBox(height: 50.h),
          ],
        ))
      ],
    ));
  }

  SliverList buildPageList() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        var item = pageList[index];
        return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  TextWithDivider(text: item.name),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: item.child.length,
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.child[index];
                      return GestureDetector(
                        onTap: () {
                          goodsinfo(it.id);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CachedNetworkImage(
                                    imageUrl: it.imageUrl, width: 150.w),
                                SizedBox(width: 20.w),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 450.w,
                                          child: Text(
                                            it.name,
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
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        RatingWidget(
                                            size: 30.w, initialRating: 5),
                                        Text('(${it?.scoreSum ?? ''})',
                                            style: TextStyle(fontSize: 10)),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "\$" +
                                          it.price +
                                          "-" +
                                          "\$" +
                                          it.mktprice,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 28.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ]));
      },
      childCount: pageList.length,
    ));
  }

  SliverList buildGoodCastList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = getGoodsCatlist[index];
          if (item.child.length > 0) {
            return Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Divider(color: Theme.of(context).primaryColor, thickness: 1),
                  SizedBox(height: 20.h),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.sp,
                      color: Color(0xFF072D8C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Divider(color: Color(0x33999999), thickness: 1),
                  Row(
                    children: item.child.map<Widget>((ite) {
                      return Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(ite.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.black,
                              )),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: item.goods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 一行显示
                      childAspectRatio: 335 / 430, // 调整子项的宽高比例
                      crossAxisSpacing: 10, // 子项之间的横向间距
                      mainAxisSpacing: 10, // 两个子项
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.goods[index];
                      return GestureDetector(
                        onTap: () => goodsinfo(it.id),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: it.imageUrl,
                                  width: 295.w,
                                ),
                                SizedBox(height: 15.sp),
                                Text(
                                  it.name,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "\$" + it.price + "-" + "\$" + it.mktprice,
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
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
        childCount: getGoodsCatlist.length,
      ),
    );
  }

  SliverPadding buildTypeList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
          childAspectRatio: 141 / 182,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            TypeItemEntity item = typeList[index];
            return GestureDetector(
              onTap: () {
                meninfo(item.id, item.name);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      width: 140.w,
                      imageUrl: item.image,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(color: Colors.white),
                      errorWidget: (context, url, error) => Icon(
                        Icons.downloading,
                        size: 141.w,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.name,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            );
          },
          childCount: typeList.length,
        ),
      ),
    );
  }

  buildFeatured(S localizations) {
    return SliverToBoxAdapter(
        child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                  child: Container(
                    alignment: Alignment.center,
                    width: 365.w,
                    child: Column(
                      children: [
                        Text(
                          localizations.featurendProdcts,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                            color: Theme.of(context).primaryColor, thickness: 1)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    seachgoods('ALL GOODS');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 65.h,
                        margin: EdgeInsets.only(right: 8),
                        padding: EdgeInsets.fromLTRB(28.w, 18.h, 28.w, 18.h),
                        color: Theme.of(context).primaryColor,
                        alignment: Alignment.center,
                        child: Text(localizations.viewAll,
                            style: TextStyle(
                                fontSize: 22.sp, color: Colors.white)),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: featurednlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行显示
                childAspectRatio: 335 / 500, // 调整子项的宽高比例
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                var it = featurednlist[index];
                return GestureDetector(
                  onTap: () {
                    goodsinfo(it.id);
                  },
                  child: GoodItem(
                    isfav:it.isfav,
                    image_url: it.image_url,
                    cat_name: it.cat_name,
                    name: it.name,
                    scoreSum: it.scoreSum,
                    price: it.price,
                    mktprice: it.mktprice,
                  ),
                );
              },
            )
          ],
        ),
      ),
    ));
  }

  void relatedList() async {
    JsonCacheManager().getJson("featurednlist").then((res) {
      if (res != null) {
        var cacheTypeList =
            jsonConvert.convertListNotNull<FeatureEntity>(json.decode(res)) ??
                [];
        setState(() {
          print("先加载缓存relatedList");
          featurednlist = cacheTypeList;
        });
      }
    });
    var data = datapost;
    var type = {
      'recommend': 1,
    };
    data['where'] = jsonEncode(type);
    ApiClient().relatedlist(data).then((res) {
      if (res['status']) {
        print("再加载网络relatedList");
        List<FeatureEntity> networkList = jsonConvert
                .convertListNotNull<FeatureEntity>(res['data']['list']) ??
            [];
        JsonCacheManager().cacheJson("featurednlist", res['data']['list']);
        setState(() {
          featurednlist = networkList;
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void getGoodsCat() {
    JsonCacheManager().getJson("getGoodsCatlist").then((res) {
      if (res != null) {
        var cacheTypeList = jsonConvert
                .convertListNotNull<GoodCatBeanEntity>(json.decode(res)) ??
            [];
        setState(() {
          print("先加载缓存getGoodsCatlist");
          getGoodsCatlist = cacheTypeList;
        });
      }
    });
    ApiClient().getGoodsCat({}).then((res) {
      if (res['status']) {
        setState(() {
          print("再加载网络getGoodsCatlist");
          getGoodsCatlist =
              jsonConvert.convertListNotNull<GoodCatBeanEntity>(res['data']) ??
                  [];
          JsonCacheManager().cacheJson("getGoodsCatlist", res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  goodsinfo(it) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GoodPage(goods_id: it)),
    );
  }

  void getTypeList() {
    JsonCacheManager().getJson("typeList").then((res) {
      if (res != null) {
        var cacheTypeList =
            jsonConvert.convertListNotNull<TypeItemEntity>(json.decode(res)) ??
                [];
        setState(() {
          typeList = cacheTypeList;
        });
      }
    });

    ApiClient().getTypeList({}).then((res) {
      if (res['status']) {
        JsonCacheManager().cacheJson("typeList", res['data']);
        setState(() {
          typeList =
              jsonConvert.convertListNotNull<TypeItemEntity>(res['data']) ?? [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void collection(int id, int index) {}

  void seachgoods(String name) {
    var where = {};
    if (name == 'SEARCH') {
      where["search_name"] = this.keyworde;
    } else {
      where["recommend"] = 1;
    }
    var wheredata = json.encode(where);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ClassifyPage(where: wheredata, name: name, id: -1)),
    );
    this.keyworde = '';
  }

  void meninfo(int id, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ClassifyPage(where: "", id: id, name: name)),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void getPageList() {
    ApiClient().getPageList({}).then((res) {
      if (res['status']) {
        successToShow('Successfully added');
        setState(() {
          pageList = jsonConvert
                  .convertListNotNull<PageBeanEntity>(res['data']['list']) ??
              [];
        });
      }
    }).catchError((err) {});
  }
}
