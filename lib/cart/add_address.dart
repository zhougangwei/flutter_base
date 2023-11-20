import 'package:atest/network/user.dart';
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

  @override
  void initState() {
    super.initState();
    this.datapost['is_def'] = 1;
  }

  void addAddress() {
    if (datapost['last_name'] == null) {
      showError('Please enter Your Last name');
      return;
    }
    if (datapost['first_name'] == null) {
      showError('Please enter Your First name');
      return;
    }
    if (datapost['country'] == null) {
      showError('Please enter Your Country/Region');
      return;
    }
    if (datapost['house_num'] == null) {
      showError('Please enter Your House number and street name');
      return;
    }
    if (datapost['etc'] == null) {
      showError('Please enter Your Apartment, suite, unit, etc');
      return;
    }
    if (datapost['city'] == null) {
      // showError('Please enter Your City');
      // return;
    }
    if (datapost['state'] == null) {
      // showError('Please enter Your State');
      // return;
    }
    if (datapost['mobile'] == null) {
      showError('Please enter Your Mob.phone no');
      return;
    }
    if (datapost['zip_code'] == null) {
      showError('Please enter Your Zip Code');
      return;
    }

    ApiClient().AddShip(datapost).then((res) {
      if (res['status']) {
        showSuccess('Successfully added');
        datapost = {};
      }
    }).catchError((err) {});
  }

  void showError(String message) {
    // Show error message
  }

  void showSuccess(String message) {
    // Show success message
  }

  @override
  Widget build(BuildContext context) {
    var localizations = S.of(context);
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              localizations.AddAddress,
              style: TextStyle(fontSize: 24.sp, color: Colors.black),
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              ObtainList(localizations.firstName, 'first_name', ""),
              ObtainList(localizations.lastName, 'last_name', ""),
              ObtainList(localizations.country, 'country', "United States (Us)"),
              ObtainList(localizations.street, 'house_num', "House number and street name"),
              ObtainList("", 'etc', "Apartment, suite, unit, etc. (optional)"),
              ObtainList(localizations.city, 'city', ""),
              ObtainList(localizations.firstName, 'state', ""),
              ObtainList(localizations.phone, 'code', ""),
              ObtainList(localizations.phone, 'mobile', ""),
              ObtainList(localizations.zipCode, 'zip_code', ""),
            ]),
          )
        ]));
  }

  ObtainList(String firstName, String key, String hint) {

    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 35.w),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(firstName!="")
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
                  style: TextStyle(fontSize: 24.sp, color: Color(0xff666666)),
                  controller: TextEditingController(),
                  onChanged: (value) {
                    setState(() {
                      datapost[key] = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff333333), width: 1.0)),
                    hintText: hint,
                  ),
                ))
          ]),
    );
  }
}
