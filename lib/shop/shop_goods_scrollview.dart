import 'dart:convert';

import 'package:atest/good/good_page.dart';
import 'package:atest/top/rounded_searchbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../classify/classify_page.dart';
import '../generated/json/base/json_convert_content.dart';
import '../network/json_cache_manager.dart';
import '../network/user.dart';
import 'bean/feature_entity.dart';
import 'bean/good_cat_bean_entity.dart';
import 'bean/type_item_entity.dart';
import 'home_banner.dart';

class ShopGoodsScrollView extends StatefulWidget {
  @override
  _ShopGoodsScrollViewState createState() => _ShopGoodsScrollViewState();
}

class _ShopGoodsScrollViewState extends State<ShopGoodsScrollView> {
  List<GoodCatBeanEntity> getGoodsCatlist = [];
  List<TypeItemEntity> typeList = [];
  List<FeatureEntity> featurednlist = [];
  var datapost = {"page": "1", "limit": "4"};

  @override
  void initState() {
    super.initState();
    getTypeList();
    relatedList();
    getGoodsCat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [
        SliverToBoxAdapter(child: RoundedSearchBar()),
        SliverToBoxAdapter(child: HomeCarouselBanner()),
        buildTypeList(),
        buildFeatured(),
        buildGoodCastList(),
      ],
    ));
  }

  SliverList buildGoodCastList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = getGoodsCatlist[index];
          if (item.child.length > 0) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Divider(color: Colors.blue, thickness: 1),
                  SizedBox(height: 20),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF072D8C),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey, thickness: 1),
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
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
                      childAspectRatio: 335 / 475, // 调整子项的宽高比例
                      crossAxisSpacing: 10, // 子项之间的横向间距
                      mainAxisSpacing: 10, // 两个子项
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.goods[index];
                      return GestureDetector(
                        onTap: () => goodsinfo(it.id),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CachedNetworkImage(imageUrl: it.imageUrl),
                              SizedBox(height: 15),
                              Text(
                                it.name,
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
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: CachedNetworkImageProvider(
                      item.image,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.name,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
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

  buildFeatured() {
    return SliverToBoxAdapter(
        child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Container(
                  width: 132,
                  child: Column(
                    children: [
                      Text(
                        "Featured",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(color: Colors.grey, thickness: 1)
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: featurednlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行显示
                childAspectRatio: 335 / 475, // 调整子项的宽高比例
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                var item = featurednlist[index];
                return GestureDetector(
                  onTap: () {
                    goodsinfo(item.id);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CachedNetworkImage(imageUrl: item.image_url),
                          Text(
                            item.cat_name,
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
            )
          ],
        ),
      ),
    ));
  }

  void relatedList() {
    var data = datapost;
    var type = {
      'recommend': 1,
    };
    data['where'] = jsonEncode(type);
    ApiClient().relatedlist(data).then((res) {
      if (res['status']) {
        setState(() {
          featurednlist = jsonConvert
                  .convertListNotNull<FeatureEntity>(res['data']['list']) ??
              [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void getGoodsCat() {
    ApiClient().getGoodsCat({}).then((res) {
      if (res['status']) {
        setState(() {
          getGoodsCatlist =
              jsonConvert.convertListNotNull<GoodCatBeanEntity>(res['data']) ??
                  [];
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
    setState(() {
      var cacheTypeList = jsonConvert.convertListNotNull<TypeItemEntity>(
              JsonCacheManager().getJson("typeList")) ??
          [];
      typeList = cacheTypeList;
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

  void meninfo(int id, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ClassifyPage(id: id, name: name)),
    );
  }
}
