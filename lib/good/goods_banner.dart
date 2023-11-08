import 'dart:convert';

import 'package:atest/shop/bean/banner_bean_entity.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
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
    return Carousel(widget.bannerList!!);
  }
}
