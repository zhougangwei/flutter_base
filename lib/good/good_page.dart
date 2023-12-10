import 'package:abce/shop/bean/good_bean_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../eventbus/eventbus.dart';
import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/login_page.dart';
import '../network/user.dart';
import '../shop/bean/feature_entity.dart';
import '../utils/common_utils.dart';
import '../widget/custom_scaffoldr.dart';
import '../widget/number_box.dart';
import '../widget/rating_widget.dart';
import 'good_foot.dart';
import 'goods_banner.dart';
import 'html_widget.dart';

class GoodPage extends StatefulWidget {
  const GoodPage({super.key, required this.goods_id});

  @override
  _GoodPageState createState() => _GoodPageState();

  final int goods_id;
}

class _GoodPageState extends State<GoodPage> {
  List<FeatureEntity> featurednlist = [];
  final GlobalKey<HtmlWidgetState> _html_key = GlobalKey<HtmlWidgetState>();

  GoodBeanEntity? goods_data;

  List<String>? goodsparams;
  bool _isExpanded = false;
  bool _isReviewExpanded = false;
  Map<String, dynamic>? Size;
  Map<String, dynamic>? default_spes_desc;
  int currentIndex = 0;

  late S localizations;

  int num = 1;

  @override
  void initState() {
    super.initState();
    getGoodsInfo();
    getgoodscomment();
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
            try {
              if (res['data']['spes_desc'] != null &&
                  res['data']['spes_desc'] != "") {
                this.Size = res['data']['spes_desc']['Size'];
              }
              if (res['data']['product'] != null &&
                  res['data']['product'] != "") {
                this.default_spes_desc =
                    res['data']['product']['default_spes_desc'];
              }
            } catch (e) {}
            //{\"853\":\"50ml\",\"854\":\"100ml\",\"856\":\"30ml\"}
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
                  obtainDefaultContainer(),
                  SizedBox(height: 20.h), // 设置间距
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
                  SizedBox(height: 40.h),
                  Divider(height: 1.h, color: Color(0x33333333)),
                  SizedBox(height: 30.h),
                  NumberBox(
                    onChange: (int param) {
                      if (param > 0) {
                        num = param;
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  if (goods_data?.isfav == true)
                    obtainIsfav(localizations.CancelWishlist)
                  else
                    obtainNotFav(localizations.AddWishlist),
                  SizedBox(height: 20.h),
                  if (goods_data?.category != null)
                    Row(
                      children: [
                        Image.asset('assets/images/image/icon-9.png',
                            width: 26.w),
                        SizedBox(width: 20.w),
                        Text(localizations.Category,
                            style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold)),
                        SizedBox(width: 20.w),
                        Expanded(
                            child: Text(goods_data?.category?['category_name'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 30.sp)))
                      ],
                    ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Image.asset('assets/images/image/icon-7.png',
                          width: 26.w),
                      SizedBox(width: 20.w),
                      Text(localizations.Tags,
                          style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.bold)),
                      SizedBox(width: 20.w),
                      Expanded(
                          child: Text(goods_data?.tags ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 30.sp))),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  GestureDetector(
                    child: Container(
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          onPressed: () {
                            cartadd();
                          },
                          child: Text(localizations.addToCart,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 35.sp)),
                        )),
                  ),
                  obtainHtml(
                    "DESCRIPTION",
                  ),
                  Divider(color: Color(0xffebebeb)),
                  obtainHtml2("REVIEWS")
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
            borderRadius: BorderRadius.circular(30.w),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
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
                .toList()[i]['product_id']
                .toString());
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 25.w),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
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
    return GestureDetector(
      onTap: () {
        collection(goods_data?.id);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/image/icon-33.png', width: 26.w),
            SizedBox(width: 15.w),
            Text(text,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold))
          ]),
    );
  }

  Widget obtainIsfav(String text) {
    return GestureDetector(
      onTap: () {
        collection(goods_data?.id);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/image/icon-6.png', width: 26.w),
            SizedBox(width: 15.w),
            Text(text,
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold))
          ]),
    );
  }

  Widget obtainHtml(String title) {
    return Column(
      children: [
        Divider(color: Color(0xffebebeb)),
        GestureDetector(
          onTap: () {
            _isExpanded = !this._isExpanded;
            _html_key?.currentState?.showWidget(_isExpanded, goods_data?.intro);
          },
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.h),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontSize: 36.sp,
                              color: Theme.of(context).primaryColor),
                        )),
                  ),
                  Icon(Icons.arrow_drop_down_outlined,
                      color: Color(0xff333333), size: 50.w)
                ]),
          ),
        ),
        HtmlWidget(key: _html_key)
      ],
    );
  }

  Widget obtainHtml2(String title) {
    return Column(
      children: [
        Container(
            child: GestureDetector(
          onTap: () => {
            setState(() {
              _isReviewExpanded = !this._isReviewExpanded;
            })
          },
          child: Container(
            width: double.infinity,
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 36.sp, color: Theme.of(context).primaryColor),
                )),
          ),
        )),
      ],
    );
  }

  getHtml() {
    try {
      return Html(data: goods_data?.intro);
    } catch (e) {
      return Container();
    }
  }

  void cartadd() {
    var data = {
      'type': '1',
      'nums': this.num,
      'product_id': this.goods_data?.product?.id
    };
    ApiClient().cartadd(data).then((res) {
      if (res['status']) {
        this.num = 1;
        successToShow('Successfully added');
      } else {
        errorToShow(res['msg']);
        if (res['data'] == 14006 || res['data'] == 14007) {
          showLoginDialog();
        }
      }
    }).catchError((err) {
      if (err.status == false && err.data == 14006) {
        showLoginDialog();
      }
    });
  }

  void changeSpes(String productId) {
    ApiClient().getProductInfo({'id': productId}).then((res) {
      if (res['status']) {
        setState(() {
          this.goods_data?.price = res['data']['price'];
          this.goods_data?.id = res['data']['id'];
          this.default_spes_desc = res['data']['default_spes_desc'];
        });
      }
    }).catchError((err) {});
  }

  void showLoginDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoginPopup(onLoginSuccess: () {
            Navigator.of(context).pop();
            bus.emit('Login', true);
          });
        });
  }

  Widget obtainDefaultContainer() {
    if (default_spes_desc != null &&
        default_spes_desc?.keys?.first != null &&
        default_spes_desc?.values != null) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(default_spes_desc?.keys?.first ?? '' + ":",
                style: TextStyle(fontSize: 26.sp)),
            SizedBox(height: 15.h),
            Wrap(children: [
              for (var i = 0;
                  i <
                      default_spes_desc?[default_spes_desc?.keys?.first]
                          ?.length;
                  i++)
                obtainSIzeContainer(i),
            ])
          ]);
    } else {
      return Container();
    }
  }

  void collection(int? i) {
    if (i == null) return;
    ApiClient().goodscollection({'goods_id': i}).then((res) {
      if (res['status']) {
        setState(() {
          this.goods_data?.isfav = !(this.goods_data?.isfav ?? false);
        });
        successToShow(res['msg']);
      } else {
        if (res['data'] == 14006 || res['data'] == 14007) {
          showLoginDialog();
        }
      }
    }).catchError((err) {});
  }

  void getgoodscomment() {
    Map<String, dynamic> data = {"page": "1", "limit": "5"};
    data['goods_id'] = widget.goods_id;

    ApiClient().getgoodscomment(data).then((res) {
      if (res['status']) {
        setState(() {
          'REVIEWS（' + res['data']['list'].length + '）';
        });
        successToShow(res['msg']);
      } else {
        if (res['data'] == 14006 || res['data'] == 14007) {
          showLoginDialog();
        }
      }
    }).catchError((err) {});
  }
}
