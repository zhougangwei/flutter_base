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
  String smartData ='';

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController etcController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  final TextEditingController smartController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this.datapost['is_def'] = 1;
  }

  void addAddress() {
    datapost['last_name']= lastNameController.text;
    datapost['first_name']= firstNameController.text;
    datapost['country']= countryController.text;
    datapost['house_num']= streetController.text;
    datapost['state']= stateController.text;
    datapost['etc']= etcController.text;
    datapost['mobile']= phoneController.text;
    datapost['code']= codeController.text;
    datapost['city']= cityController.text;
    datapost['zip_code']= zipCodeController.text;


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
    if (datapost['mobile'] == null) {
      errorToShow('Please enter Your Mob.phone no');
      return;
    }
    if (datapost['zip_code'] == null) {
      errorToShow('Please enter Your Zip Code');
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
        color: Colors.white,
        height: 1200.h,
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
                          style:
                              TextStyle(fontSize: 32.sp, color: Colors.black),
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
                      ObtainIntelligentRecognition(),
                      ObtainList(localizations.firstName, 'first_name', "",
                          true, firstNameController),
                      ObtainList(localizations.lastName, 'last_name', "", true,
                          lastNameController),
                      ObtainList(localizations.country, 'country',
                          "United States (Us)", true, countryController),
                      ObtainList(
                          localizations.street,
                          'house_num',
                          "House number and street name",
                          true,
                          streetController),
                      ObtainList(
                          "",
                          'etc',
                          "Apartment, suite, unit, etc. (optional)",
                          false,
                          etcController),
                      ObtainList(localizations.city, 'city', "", false,
                          cityController),
                      ObtainList(localizations.state, 'state', "", false,
                          stateController),
                      ObtainPhone(localizations, 'code', "mobile"),
                      ObtainList(localizations.zipCode, 'zip_code', "", true,
                          zipCodeController),
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

  ObtainList(String firstName, String key, String hint, bool isRequired,
      TextEditingController controller) {
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
                  controller: controller,
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
                      controller: codeController,
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
                    controller: phoneController,
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

  ObtainIntelligentRecognition() {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 200.h,
                child: TextField(
                  maxLines: 10,
                  textInputAction: TextInputAction.done,
                  controller: smartController,
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
                      hintText: "Intelligent recognition",
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0)),
                )),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    try {
                      smartData=smartController.text;
                      List<String> datas = smartData.split(';');
                      if (datas.length >= 4) {
                        String name = datas[0];
                        List<String> namelist = name.split(' ');
                        if (namelist.length >= 2) {
                          String firstName = '';
                          String lastName = '';
                          if(namelist.length>2){
                            for(int i=0;i<namelist.length-1;i++){
                              lastName=lastName+namelist[i];
                            }
                            firstName=namelist[namelist.length-1];
                          }else{
                            firstName=namelist[1];
                             lastName = namelist[0];
                          }
                          firstNameController.text = firstName;
                          lastNameController.text = lastName;
                        }
                        String phoneNum = datas[1];
                        List<String> phoneNumList = phoneNum.split(' ');
                        if (phoneNumList.length>=2) {
                          phoneController.text = phoneNumList[1];
                          codeController.text = phoneNumList[0];
                        }

                        String address = datas[2];
                        List<String> addresslist = address.split(',');
                        if (addresslist.length >= 3) {
                          String country = addresslist[addresslist.length - 1];
                          String city = addresslist[addresslist.length - 2];
                          String menpai = addresslist[0];
                          countryController.text = country;
                          cityController.text = city;
                          streetController.text = menpai;
                          String etc='';
                          if(addresslist.length>3){
                            for(int i=1;i<addresslist.length-2;i++){
                              etc=etc+addresslist[i];
                            }
                          }
                          etcController.text=etc;
                        }

                        String youbian = datas[3];
                        zipCodeController.text = youbian;
                      }
                    } catch (err) {

                    }
                  },
                  child: Container(
                      padding: EdgeInsets.all(8),
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Perform",
                        style: TextStyle(color: Colors.white),
                      ))),
            )
          ]),
    );
  }
}
