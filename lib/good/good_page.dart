import 'package:atest/shop/bean/good_bean_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/feature_entity.dart';
import '../utils/common_utils.dart';
import '../widget/custom_scaffoldr.dart';
import '../widget/number_box.dart';
import '../widget/rating_widget.dart';
import 'good_foot.dart';
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

  List<String>? goodsparams;
  bool _isExpanded = false;
  Map<String, dynamic>? Size;
  Map<String, dynamic>? default_spes_desc;
  int currentIndex = 0;

  late S localizations;

  @override
  void initState() {
    super.initState();
    getGoodsInfo();
  }

  @override
  Widget build(BuildContext context) {
    localizations = S.of(context);
    return CustomScafflold(
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
    ApiClient().getdetial(data).then((res) {
      if (mounted) {
        if (res['status']) {
          setState(() {
            this.Size = res['data']['spes_desc'][
                'Size']; //{\"853\":\"50ml\",\"854\":\"100ml\",\"856\":\"30ml\"}
            this.default_spes_desc =
                res['data']['product']['default_spes_desc'];
            //{\"50ml\":{\"name\":\"50ml\",\"is_default\":true},\"100ml\":{\"name\":\"100ml\",\"product_id\":1618},\"30ml\":{\"name\":\"30ml\",\"product_id\":1619}}
            this.goods_data = jsonConvert.convert<GoodBeanEntity>(res['data']);
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
    ApiClient().getgoodsparams({"id": widget.goods_id}).then((res) {
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
    ApiClient().relatedlist(datapost).then((res) {
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
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 32.sp)),
                  SizedBox(height: 20.sp), // 设置间距
                  Row(
                    children: [
                      RatingWidget(size: 30.w, initialRating: 5),
                      Text('(${goods_data?.scoreSum ?? ''})',
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  SizedBox(height: 18.h), // 设置间距
                  Text('\$${goods_data?.price ?? ''}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50.sp)),
                  SizedBox(height: 10.h), // 设置间距
                  Text('In Stock (${goods_data?.stock ?? ''})',
                      style: TextStyle(
                          fontSize: 26.sp,
                          color: Theme.of(context).primaryColor)),
                  SizedBox(height: 15.h),
                  if (default_spes_desc != null &&
                      default_spes_desc?.keys?.first != null &&
                      default_spes_desc?.values != null)
                    Text(default_spes_desc?.keys?.first ?? '',
                        style: TextStyle(fontSize: 26.sp)),
                  SizedBox(height: 15.h),
                  Wrap(children: [
                    for (var i = 0;
                        i <
                            default_spes_desc![default_spes_desc?.keys?.first]
                                .length;
                        i++)
                      obtainSIzeContainer(i),
                  ]),
                  SizedBox(height: 10.0), // 设置间距
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/image/icon-8.png',
                            width: 26.w),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(goods_data?.canshu?[0]?.value ?? '',
                              softWrap: true,
                              style: TextStyle(fontSize: 28.sp)),
                        )
                      ]),
                  NumberBox(),
                  if (goods_data?.isfav == true)
                    obtainIsfav(localizations.CancelWishlist)
                  else
                    obtainNotFav(localizations.AddWishlist),
                  if (goods_data?.category != null)
                    Row(
                      children: [
                        Image.asset('assets/images/image/icon-9.png',
                            width: 26.w),
                        Text(goods_data?.category?.toString() ?? ''),
                      ],
                    ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset('assets/images/image/icon-7.png',
                          width: 26.w),
                      SizedBox(width: 15.w),
                      Text(goods_data?.tags ?? ''),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:Theme.of(context).primaryColor),
                        onPressed: () {
                          cartadd();
                        },
                        child: Text("072D8CFF")),
                  ),
                  ObtainHtmlPanelList("DESCRIPTION", getHtml()),
                  ObtainHtmlPanelList("REVIEWS", Container()),
                ])),
        GoodFoot()
      ],
    );
  }

  Widget obtainSIzeContainer(int i) {
    if (currentIndex == i)
      return Container(
        margin: EdgeInsets.only(right: 25.w),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).primaryColor,
            ),
            borderRadius: BorderRadius.circular(35.w),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              default_spes_desc![default_spes_desc?.keys?.first]
                  .values
                  .toList()[i]['name'],
            ),
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: () {
          setState(() {
            currentIndex = i;
            changeSpes(default_spes_desc![default_spes_desc?.keys?.first]
                .values
                .toList()[i]['product_id']);
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 25.w),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                default_spes_desc![default_spes_desc?.keys?.first]
                    .values
                    .toList()[i]['name'],
              ),
            ),
          ),
        ),
      );
  }

  Widget obtainNotFav(String text) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/image/icon-33.png', width: 26.w),
          SizedBox(width:15.w),
          Text(text,
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold))
        ]);
  }

  Widget obtainIsfav(String text) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/image/icon-6.png', width: 26.w),
          SizedBox(width:15.w),
          Text(text,
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold))
        ]);
  }

  ExpansionPanelList ObtainHtmlPanelList(String title, Widget body) {
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
                          alignment: Alignment.centerLeft, child: Text(title)),
                    ),
                  ));
            },
            body: body,
            isExpanded: _isExpanded,
          ),
        ]);
  }

  getHtml() {
    try {
      //return Html(data: goods_data?.intro);
      return Container();
    } catch (e) {
      return Container();
    }
  }

  void cartadd() {}

  void changeSpes(String productId) {
    ApiClient().getProductInfo({'id': productId}).then((res) {
      if (res.status) {
        successToShow(res.msg);
        setState(() {
          this.goods_data?.price = res['data']['price'];
        });
      }
    }).catchError((err) {});
  }
}
