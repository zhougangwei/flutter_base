import 'package:abce/network/user.dart';
import 'package:abce/widget/custom_scaffoldr.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../shop/bean/qr_bean_entity.dart';
import '../utils/common_utils.dart';

class ChargeInfo extends StatefulWidget {
  const ChargeInfo({super.key});

  @override
  State<ChargeInfo> createState() => _ChargeInfoState();
}

class _ChargeInfoState extends State<ChargeInfo> {
  QrBeanEntity? qrinfo;

  var selectedOption;

  @override
  void initState() {
    createcode();
    super.initState();
  }

  createcode() {
    //获取充值的二维码
    ApiClient().createcode({"symbol": 'usdt'}).then((value) {
      if (value['status']) {
        setState(() {
          this.qrinfo = jsonConvert.convert<QrBeanEntity>(value['data']);
        });
      } else {}
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return CustomScafflold(
        body: CustomScrollView(
      physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              obtainText(local.str13),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    padding: EdgeInsets.all(25.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color.fromRGBO(102, 102, 102, 0.3),
                      ),
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            local.USDT,
                            style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 28.sp,
                            ),
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_outlined,
                            color: Color(0xff333333), size: 50.w),
                      ],
                    ),
                  )),
                ],
              ),
              SizedBox(height: 30.h),
              obtainText(local.attentions),
              SizedBox(height: 30.h),
              Text(local.str8),
              SizedBox(height: 30.h),
              obtainText(local.str9),
              Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                margin: EdgeInsets.all(25.h),
                padding: EdgeInsets.all(25.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                    color: Color.fromRGBO(102, 102, 102, 0.3),
                  ),
                  borderRadius: BorderRadius.circular(5.w),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.chainName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        padding: EdgeInsets.only(left: 25.h),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        height: 78.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color.fromRGBO(102, 102, 102, 0.3),
                          ),
                          borderRadius: BorderRadius.circular(5.w),
                        ),
                        child: Text(
                          local.ethereum,
                          style: TextStyle(
                            fontSize: 28.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Text(
                        local.rechargeAddress,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Center(
                        child: Builder(builder: (context) {
                          if (qrinfo?.qrCode != null) {
                            return CachedNetworkImage(
                                imageUrl: qrinfo!.qrCode, width: 330.w);
                          } else {
                            return Container(
                              height: 330.h,
                            );
                          }
                        }),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 25.h),
                              alignment: Alignment.centerLeft,
                              height: 78.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromRGBO(102, 102, 102, 0.3),
                                ),
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              child: Text(
                                qrinfo?.qrCodeId ?? "",
                                style: TextStyle(
                                  fontSize: 28.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 77.h,
                            padding: EdgeInsets.only(left: 40.w, right: 40.w),
                            alignment: Alignment.center,
                            color: Color(0xff072D8C),
                            child: GestureDetector(
                              onTap: (){
                                Clipboard.setData(ClipboardData(text: qrinfo?.qrCodes??""));
                                successToShow('Copy succeeded');
                              },
                              child: Text(
                                local.copy,
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            local.Recharge,
                            style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                local.cashAccount,
                                style: TextStyle(
                                  color: Color(0xffFB641B),
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.arrow_drop_down_outlined,
                                  color: Color(0xffFB641B), size: 30.w),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
            ],
          ),
        ))
      ],
    ));
  }

  Widget obtainText(String text) {
    return Container(
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 3.h,
          child: Container(
            width: double.infinity,
            child: Divider(
              color: Colors.grey,
              thickness: 2.h,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15.0.h,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 3.h,
              child: Divider(
                color: Theme.of(context).primaryColor,
                thickness: 3.h,
              ),
            ),
          ],
        )
      ]),
    );
  }
}
