import 'package:atest/shop/bean/good_bean_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../generated/json/base/json_convert_content.dart';
import '../network/user.dart';
import '../shop/bean/feature_entity.dart';
import '../widget/number_box.dart';
import '../widget/rating_widget.dart';
import 'goods_banner.dart';

class GoodPage extends StatefulWidget {
  const GoodPage({super.key, required this.goods_id});

  @override
  _GoodPageState createState() => _GoodPageState();

  final int goods_id;
}

class _GoodPageState extends State<GoodPage> {
  List<FeatureEntity> featurednlist = [];

  GoodBeanEntity? goods_data;

  int? product_id;

  List<String>? goodsparams;
  bool _isExpanded = false;
  Map<String, dynamic>? Size;
  Map<String, dynamic>? default_spes_desc;

  @override
  void initState() {
    super.initState();
    getGoodsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
        slivers: [
          SliverToBoxAdapter(
              child: GoodCarouselBanner(bannerList: goods_data?.album)),
          SliverToBoxAdapter(child: GoodsInfoPage())
        ],
      ),
    );
  }

  void getGoodsInfo() {
    var data = {"id": widget.goods_id.toString()};
    HttpClient().getdetial(data).then((res) {
      if (mounted) {
        if (res['status']) {
          setState(() {
            this.Size = res['data']['spes_desc'][
                'Size']; //{\"853\":\"50ml\",\"854\":\"100ml\",\"856\":\"30ml\"}
            this.default_spes_desc =
                res['data']['product']['default_spes_desc']['Size'];
            //{\"50ml\":{\"name\":\"50ml\",\"is_default\":true},\"100ml\":{\"name\":\"100ml\",\"product_id\":1618},\"30ml\":{\"name\":\"30ml\",\"product_id\":1619}}
            this.goods_data = jsonConvert.convert<GoodBeanEntity>(res['data']);
            this.product_id = this.goods_data?.product.id;
          });
          getRelatedList(goods_data?.goodsCatId);
        }
      }
    }).catchError((err) {
      err.toString();
    });
  }

  getparams() {
    //获取商品参数
    HttpClient().getgoodsparams({"id": widget.goods_id}).then((res) {
      if (mounted) {
        if (res['status']) {
          setState(() {
            this.goodsparams =
                jsonConvert.convertListNotNull<String>(res['data']);
          });
        }
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void getRelatedList(int? categoryId) {
    if (categoryId == null) {
      return;
    }
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

  GoodsInfoPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(goods_data?.name ?? '',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 10.0), // 设置间距
                  Row(
                    children: [
                      RatingWidget(
                          size: 15,
                          initialRating:
                              double.parse(goods_data?.scoreSum ?? "5.0")),
                      Text('(${goods_data?.scoreSum ?? ''})',
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  SizedBox(height: 10.0), // 设置间距
                  Text('\$${goods_data?.price ?? ''}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 10.0), // 设置间距

                  Text('In Stock (${goods_data?.stock ?? ''})'),
                  SizedBox(height: 10.0), // 设置间距

                  Text(goods_data?.canshu?.toString() ?? ''),
                  NumberBox(),
                  Text(goods_data?.isfav?.toString() ?? ''),
                  Text(goods_data?.category?.toString() ?? ''),
                  Text(goods_data?.tags ?? ''),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        onPressed: () {
                          cartadd();
                        },
                        child: Text("072D8CFF")),
                  ),
                  ObtainHtmlPanelList(),
                ])),
      ],
    );
  }

  ExpansionPanelList ObtainHtmlPanelList() {
    return ExpansionPanelList(
        elevation: 0,
        dividerColor: Colors.transparent,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _isExpanded = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => {
                      setState(() {
                        _isExpanded = !isExpanded;
                      })
                    },
                    child: Container(
                      width: double.infinity,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("DESCRIPTION")),
                    ),
                  ));
            },
            body: getHtml(),
            isExpanded: _isExpanded,
          ),
        ]);
  }

  getHtml() {
    try {
      return Html(data: goods_data?.intro);
    } catch (e) {
      return Container();
    }
  }

  void cartadd() {}
}
