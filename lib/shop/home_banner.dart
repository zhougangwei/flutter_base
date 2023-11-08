import 'dart:convert';

import 'package:atest/shop/bean/banner_bean_entity.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../generated/json/base/json_convert_content.dart';
import '../network/api.dart';
import '../network/user.dart';
import '../widget/carousel.dart';
import 'bean/good_cat_bean_entity.dart';

class HomeCarouselBanner extends StatefulWidget {
  @override
  _HomeCarouselBannerState createState() => _HomeCarouselBannerState();
}

class _HomeCarouselBannerState extends State<HomeCarouselBanner> {
  List<String> bannerList = [];

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  void getBanner() {
    var data = {"page": 1, "limit": 10, "code": 'tpl1_slider'};
    HttpClient().openbanner(data).then((res) {
      setState(() {
        if (res['status']) {
         List<BannerBeanEntity> list = jsonConvert.convertListNotNull<BannerBeanEntity>(res['data']['list'])??[];
          for (var i in list) {
            this.bannerList.add(i.img);
          }
        }
      });
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(bannerList);
  }
}