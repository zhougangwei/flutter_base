import 'dart:convert';

import 'package:atest/shop/bean/banner_bean_entity.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generated/json/base/json_convert_content.dart';
import '../network/api.dart';
import '../network/user.dart';
import '../widget/carousel.dart';

class GoodCarouselBanner extends StatefulWidget {
  final List<String>? bannerList;

  const GoodCarouselBanner({super.key, required this.bannerList});

  @override
  _GoodCarouselBannerState createState() => _GoodCarouselBannerState();
}

class _GoodCarouselBannerState extends State<GoodCarouselBanner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bannerList == null || widget.bannerList!.isEmpty) {
      return Container();
    }
    return Container(
        height: 491.h,
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(20),
            left: ScreenUtil().setWidth(30),
            right: ScreenUtil().setWidth(30)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.h),
            child: Carousel(this.widget.bannerList!!)));
  }
}
