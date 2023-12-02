import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../network/json_cache_manager.dart';
import '../network/user.dart';
import '../shop/bean/setting_bean_entity.dart';

class GoodFoot extends StatefulWidget {
  const GoodFoot({super.key});

  @override
  _GoodFootState createState() => _GoodFootState();
}

class _GoodFootState extends State<GoodFoot> {
  SettingBeanEntity? footdata;

  @override
  void initState() {
    super.initState();
    getFootData();
  }

  void getFootData() {

    JsonCacheManager().getJson("foot").then((res) {
      if (res != null) {
        var cacheTypeList =
            jsonConvert.convert<SettingBeanEntity>(json.decode(res));
        setState(() {
          footdata = cacheTypeList;
        });
      }
    });

    ApiClient().getSettingList({}).then((res) {
      if (res['status']) {
        setState(() {
          footdata = jsonConvert.convert<SettingBeanEntity>(res['data']);
          JsonCacheManager().cacheJson("foot",res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobileView();
  }

  Widget _buildMobileView() {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      color: Color(0xff072D8C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 48.h),
          Image.asset(
            'assets/images/image/icon-logo.png',
            height: 92.w,
          ),
          SizedBox(height: 37.h),
          Text(
            footdata?.shopContent ?? '',
            style: TextStyle(fontSize: 24.sp, color: Colors.white),
          ),
          SizedBox(height: 21.h),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/image/icon-12.png',
                width: 20.w,
              ),
              SizedBox(width: 10.w),
              Text(
                footdata?.shopAddress ?? '',
                style: TextStyle(fontSize: 24.sp, color: Colors.white),
                // Replace with your 'footdata.shop_address'
              )
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Image.asset(
                'assets/images/image/icon-11.png',
                width: 20.w,
              ),
              SizedBox(width: 10.w),
              Text(footdata?.shopEmail ?? '',
                  style: TextStyle(fontSize: 24.sp, color: Colors.white)),
              // Replace with your 'footdata.shop_email'
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Image.asset(
                'assets/images/image/icon-10.png',
                width: 20.w,
              ),
              SizedBox(width: 10),
              Text(footdata?.shopTime ?? '',
                  style: TextStyle(fontSize: 24.sp, color: Colors.white)),
              // Replace with your 'footdata.shop_time'
            ],
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/images/image/icon-14.png',
            height: 52.h,
          ),
          SizedBox(height: 20.w),
          Container(
            color: Colors.blue,
            height: 0.1,
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              footdata?.shopBeian ?? '',
              // Replace with your 'footdata.shop_beian'
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22.sp, color: Colors.white),
            ),
          ),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }
}
