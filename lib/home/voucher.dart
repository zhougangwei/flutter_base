import 'package:atest/good/good_foot.dart';
import 'package:atest/login/login_locale.dart';
import 'package:atest/shop/home_banner.dart';
import 'package:atest/widget/custom_scaffoldr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../login/page_controller_provider.dart';
import '../network/user.dart';
import '../widget/carousel.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage>
    with AutomaticKeepAliveClientMixin {
  List<String> wishlishlist = [];
  var datapost = {"page": "1", "limit": "10"};

  @override
  void initState() {
    print('AACCDD执行了VoucherPage 1initState');
    var data = this.datapost;
    if (LoginStatus.hasLogin()) {
      ApiClient().couponlist(data).then((res) {
        if (res['status']) {
          setState(() {});
        }
      }).catchError((err) {
        err.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var localizations = S.of(context);
    return CustomScafflold(
        body: CustomScrollView(
            physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
            slivers: [
          SliverToBoxAdapter(child: obtainWishTilte(context, localizations)),
          buildGoodCastList(),
          SliverToBoxAdapter(child: GoodFoot()),
        ]));
  }

  SliverList buildGoodCastList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = wishlishlist[index];
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: wishlishlist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 一行显示
                childAspectRatio: 335 / 475, // 调整子项的宽高比例
                crossAxisSpacing: 10, // 子项之间的横向间距
                mainAxisSpacing: 10, // 两个子项
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container();
              },
            ),
          );
        },
        childCount: wishlishlist.length,
      ),
    );
  }

  Column obtainWishTilte(BuildContext context, S localizations) {
    return Column(children: [
      Container(
        width: double.infinity,
        color: Color(0xfff5f5f5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 45.h),
              Text(localizations.voucherCenter,
                  style: TextStyle(
                      fontSize: 62.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text(localizations.homeVoucher,
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50.h),
              HomeCarouselBanner(from: 'coupon_article_top'),
              SizedBox(height: 50.h),
              Text(localizations.couponCenter,
                  style: TextStyle(
                      fontSize: 48.sp,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold)),
              Text(localizations.str6,
                  style: TextStyle(fontSize: 28.sp, color: Colors.black)),
              Text(localizations.saveMoney,
                  style: TextStyle(fontSize: 28.sp, color: Colors.black)),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Image.asset('assets/images/image/icon-18.png', width: 70.w),
                    SizedBox(height: 10.h),
                    Text(localizations.timeLimit,
                        style: TextStyle(fontSize: 28.sp, color: Colors.black)),
                  ]),
                  Column(children: [
                    Image.asset('assets/images/image/icon-19.png', width: 70.w),
                    SizedBox(height: 10.h),
                    Text(localizations.overlayUse,
                        style: TextStyle(fontSize: 28.sp, color: Colors.black)),
                  ]),
                  Column(children: [
                    Image.asset('assets/images/image/icon-20.png', width: 70.w),
                    SizedBox(height: 10.h),
                    Text(localizations.variety,
                        style: TextStyle(fontSize: 28.sp, color: Colors.black)),
                  ])
                ],
              ),
              SizedBox(height: 60.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Provider.of<PageControllerProvider>(context, listen: false)
                      .goToPage(3);
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Color(0xffFB641B),
                  height: 80.h,
                  width: 306.w,
                  child: Text(localizations.myCoupon,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 90.h),
            ]),
      )
    ]);
  }

  goodsinfo(id) {}

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
