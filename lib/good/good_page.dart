import 'dart:convert';

import 'package:atest/shop/custom_goods_scrollview.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../generated/json/base/json_convert_content.dart';
import '../network/user.dart';
import '../shop/bean/feature_entity.dart';
import '../shop/home_banner.dart';

class GoodPage extends StatefulWidget {
  const GoodPage({super.key, required this.goods_id});

  @override
  _GoodPageState createState() => _GoodPageState();

  final int goods_id;
}

class _GoodPageState extends State<GoodPage> {
  List<FeatureEntity> featurednlist = [];

  var goods_data;

  var product_id;

  @override
  void initState() {
    super.initState();
    getGoodsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [
        SliverToBoxAdapter(child: HomeCarouselBanner()),
      ],
    );
  }

  void getGoodsInfo()  {
    var data = {"id": widget.goods_id.toString()};
    HttpClient().getdetial(data).then((res) {
      if (mounted) {
        if (res['status']) {
          this.goods_data = res['data'];
          var products = goods_data.product;
         // this.product_id = products.id
          setState(() {

          });
          getRelatedList(goods_data.goods_cat_id);
        }
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void getRelatedList(int categoryId) {
    var datapost = {"page": "1", "limit": "4"};
    datapost['where'] = '{"goods_cat_id":${categoryId}}';
    HttpClient().relatedlist(datapost).then((res) {
      if (mounted) {
        if (res['status']) {
          setState(() {
            featurednlist = jsonConvert
                    .convertListNotNull<FeatureEntity>(res['data']['list']) ??
                [];
          });
        }
      }
    }).catchError((err) {
      err.toString();
    });
  }
}
