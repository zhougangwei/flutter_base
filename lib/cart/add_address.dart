import 'package:abce/network/user.dart';
import 'package:abce/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';

class Add_Address extends StatefulWidget {
  const Add_Address({super.key});

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  Map<String, dynamic> datapost = {"is_def": 1};
  final TextEditingController aController = TextEditingController();
  final TextEditingController a = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.datapost['is_def'] = 1;
  }

  void addAddress() {
    if (datapost['last_name'] == null) {
      errorToShow('Please enter Your Last name');
      return;
    }
    if (datapost['first_name'] == null) {
      errorToShow('Please enter Your First name');
      return;
    }
    if (datapost['country'] == null) {
      errorToShow('Please enter Your Country/Region');
      return;
    }
    if (datapost['house_num'] == null) {
      errorToShow('Please enter Your House number and street name');
      return;
    }
    if (datapost['etc'] == null) {
      errorToShow('Please enter Your Apartment, suite, unit, etc');
      return;
    }
    if (datapost['city'] == null) {
      // errorToShow('Please enter Your City');
      // return;
    }
    if (datapost['state'] == null) {
      // errorToShow('Please enter Your State');
      // return;
    }
    if (datapost['mobile'] == null) {
      errorToShow('Please enter Your Mob.phone no');
      return;
    }
    if (datapost['zip_code'] == null) {
      errorToShow('Please enter Your Zip Code');
      return;
    }

    ApiClient().AddShip(datapost).then((res) {
      if (res['status']) {
        successToShow('Successfully added');
        datapost = {};
        Navigator.of(context).pop(true);
      }
    }).catchError((err) {});
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Container(
      color:Colors.white,
      height: 1000.h,
        child: Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(25.w),
                    color: Color(0x11999999),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      localizations.AddAddress,
                      style: TextStyle(fontSize: 32.sp, color: Colors.black),
                    ),
                  ),
                  Positioned(
                      right: 10,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        ),
                      ))
                ],
              ),
              Expanded(
                child: ListView(children: <Widget>[
                  ObtainList(localizations.firstName, 'first_name', "", true),
                  ObtainList(localizations.lastName, 'last_name', "", true),
                  ObtainList(localizations.country, 'country',
                      "United States (Us)", true),
                  ObtainList(localizations.street, 'house_num',
                      "House number and street name", true),
                  ObtainList("", 'etc',
                      "Apartment, suite, unit, etc. (optional)", false),
                  ObtainList(localizations.city, 'city', "", false),
                  ObtainList(localizations.state, 'state', "", false),
                  ObtainPhone(localizations, 'code', "mobile"),
                  ObtainList(localizations.zipCode, 'zip_code', "", true),
                  SizedBox(
                    height: 100.h,
                  )
                ]),
              ),
              SizedBox(
                height: 100.h,
              )
            ]),
        Positioned(
            right: 0,
            left: 0,
            bottom: 1.h,
            child: GestureDetector(
              onTap: () {
                confirm();
              },
              child: Container(
                height: 90.h,
                color: Color(0xffFB641B), // 自定义头部的背景颜色
                child: Center(
                  child: Text(
                    localizations.confirm,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ))
      ],
    ));
  }

  ObtainList(String firstName, String key, String hint, bool isRequired) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (firstName != "")
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 25.w),
                      child: Text(
                        firstName,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    if (isRequired)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Text(
                          '*',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            SizedBox(height: 10.h),
            Container(
                height: 78.h,
                child: TextField(
                  onChanged: (value) {
                    datapost[key] = value;
                  },
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 24.sp),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff333333), width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      hintText: hint,
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0)),
                ))
          ]),
    );
  }

  ObtainPhone(S localizations, String code, String mobile) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 25.w),
                    child: Text(
                      localizations.phone,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Container(
                    height: 78.h,
                    width: 128.w,
                    child: TextField(
                      onChanged: (value) {
                        datapost[code] = value;
                      },
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 24.sp),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff333333), width: 1.0)),
                          hintText: "code",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)),
                    )),
                SizedBox(width: 20.w),
                Expanded(
                    child: Container(
                  height: 78.h,
                  child: TextField(
                    onChanged: (value) {
                      datapost[mobile] = value;
                    },
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 24.sp),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff333333), width: 1.0)),
                        hintText: "Please enter your Mob.phone no.",
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.0)),
                  ),
                ))
              ],
            )
          ]),
    );
  }

  void confirm() {
    addAddress();
  }
}
