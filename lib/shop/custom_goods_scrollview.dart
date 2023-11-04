import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../generated/json/base/json_convert_content.dart';
import '../network/user.dart';
import 'banner.dart';
import 'bean/feature_entity.dart';
import 'bean/good_cat_bean_entity.dart';
import 'bean/type_item_entity.dart';

class CustomGoodsScrollView extends StatefulWidget {
  @override
  _CustomGoodsScrollViewState createState() => _CustomGoodsScrollViewState();
}

class _CustomGoodsScrollViewState extends State<CustomGoodsScrollView> {
  List<GoodCatBeanEntity> getGoodsCatlist = [];
  List<TypeItemEntity> typeList = [];
  List<FeatureEntity> featurednlist = [];
  var datapost = {"page": "1", "limit": "4"};

  @override
  void initState() {
    super.initState();
    getGoodsCat();
    getTypeList();
    relatedList();
  }

  void relatedList() {
    var data = datapost;
    var type = {
      'recommend': 1,
    };
    data['where'] = jsonEncode(type);
    HttpClient().relatedlist(data).then((res) {
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
    HttpClient().getGoodsCat({}).then((res) {
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

  goodsinfo(it) {}

  void getTypeList() {
    HttpClient().getTypeList({}).then((res) {
      if (res['status']) {
        setState(() {
          typeList =
              jsonConvert.convertListNotNull<TypeItemEntity>(res['data']) ?? [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [
        SliverToBoxAdapter(child: CarouselBanner()),
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
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 一行显示
                      childAspectRatio: 335 / 475, // 调整子项的宽高比例
                      crossAxisSpacing: 10, // 子项之间的横向间距
                      mainAxisSpacing: 10, // 两个子项
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.goods[index];
                      return Card(
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
          childAspectRatio: 141/182,
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

  void meninfo(double id, String name) {}

  buildFeatured() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            var item = featurednlist[index];
            return GestureDetector(
              onTap: () {
                goodsinfo(item.id);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      child: CachedNetworkImage(
                        imageUrl: item.image_url,
                        width: double.infinity,
                        height: 390,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: GestureDetector(
                        onTap: () {
                          collection(item.id, index);
                        },
                        child: Icon(
                          item.isfav == false
                              ? Icons.favorite_border
                              : Icons.favorite,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          childCount: featurednlist.length,
        ),
      ),
    );
  }

  void collection(double id, int index) {}
}
