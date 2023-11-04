import 'dart:convert';

import 'package:flutter/material.dart';

import '../generated/json/base/json_convert_content.dart';
import '../network/user.dart';
import 'banner.dart';
import 'bean/good_cat_bean_entity.dart';
import 'bean/type_item_entity.dart';

class CustomGoodsScrollView extends StatefulWidget {
  @override
  _CustomGoodsScrollViewState createState() => _CustomGoodsScrollViewState();
}

class _CustomGoodsScrollViewState extends State<CustomGoodsScrollView> {
  List<GoodCatBeanEntity> getGoodsCatlist = [];
  List<TypeItemEntity> typeList = [];
  List<TypeItemEntity> featurednlist = [];
  var datapost = {"page": 1, "limit": 4};

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
        featurednlist = (res['data']['list']);
      }
    }).catchError((err) {});
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
        buildSliverList(),
      ],
    ));
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = getGoodsCatlist[index];
          if (item.child.length > 0) {
            return Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Divider(color: Colors.blue, thickness: 1),
                  SizedBox(height: 40),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Divider(color: Colors.grey, thickness: 1),
                  Row(
                    children: item.child.map<Widget>((ite) {
                      return Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            ite.name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: item.goods.map<Widget>((it) {
                          return Expanded(
                            flex: 6,
                            child: GestureDetector(
                              onTap: () => goodsinfo(it.id),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Image.network(
                                      it.imageUrl,
                                      width: double.infinity,
                                      height: 390,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      it.name,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '\$$it.price-\$$it.mktprice',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            TypeItemEntity item = typeList[index];
            return GestureDetector(
              onTap: () {
                meninfo(item.id, item.name);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    item.image,
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.name,
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
}
