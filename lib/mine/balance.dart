import 'package:abce/widget/custom_scaffoldr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../network/user.dart';
import '../shop/bean/user_info_entity.dart';
import '../utils/common_utils.dart';
import 'chargeinfo.dart';

class BalancePage extends StatefulWidget {
  const BalancePage({super.key});

  @override
  State<BalancePage> createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  UserInfoEntity? userinfo;

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return CustomScafflold(
      body: Container(
        height: 517.h,
        margin: EdgeInsets.all(30.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(102, 102, 102, 0.3),
          ),
          borderRadius: BorderRadius.circular(30.w),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Text(
              "\$${userinfo?.balance ?? ""}",
              style: TextStyle(fontSize: 62.sp, color: Color(0xffFB641B)),
            ),
            Text(localizations.balance,
                style: TextStyle(fontSize: 41.sp, color: Color(0xff333333))),
            SizedBox(
              height: 48.h,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChargeInfo()),
                        );
                      },
                      child: Container(
                        height: 91.h,
                        width: 293.w,
                        alignment: Alignment.center,
                        color: Color(0xffFB641B),
                        child: Text(
                          localizations.crypto,
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        errorToShow(
                            'Changing the payment method is not supported in your country');
                      },
                      child: Container(
                        height: 91.h,
                        width: 293.w,
                        alignment: Alignment.center,
                        color: Color(0xff072D8C),
                        child: Text(
                          localizations.alipay,
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        errorToShow('In maintenance');
                      },
                      child: Container(
                        height: 91.h,
                        width: 293.w,
                        alignment: Alignment.center,
                        color: Color(0xffDB7D83),
                        child: Text(
                          localizations.wireTransfer,
                          style:
                              TextStyle(fontSize: 28.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    Container(height: 91.h, width: 293.w)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getuserinfo();
  }

  getuserinfo() {
    ApiClient().getuserinfo({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert.convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }
}
