import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/good/good_foot.dart';
import 'package:abce/widget/custom_scaffoldr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';
import '../network/user.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return CustomScafflold(
      body: Column(
        children: [obtainWishTilte(context,localizations),
          Container(height: 200.h,color:Colors.white),
          GoodFoot()],
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
              Text(localizations.faq,
                  style: TextStyle(
                      fontSize: 62.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Text(localizations.homeFAQ,
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 45.h),
            ]),
      )
    ]);
  }

  @override
  void initState() {
    getfaqlist();
    super.initState();
  }

  void getfaqlist() {
    ApiClient().getfaqlist({}).then((res) {
      if (res['status']) {
        setState(() {});
      }
    }).catchError((err) {
      err.toString();
    });
  }
}
