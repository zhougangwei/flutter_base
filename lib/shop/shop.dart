import 'dart:convert';

import 'package:atest/shop/shop_goods_scrollview.dart';
import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../network/user.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<dynamic> PageList = [];

  List<dynamic> featurednlist = [];
  List<dynamic> TypeList = [];
  String keyworde = '';
  bool showlist = false;



  void searchgoods(String name) {
    Map<String, dynamic> where = {};
    if (name == 'SEARCH') {
      where['search_name'] = keyworde;
    } else {
      where['recommend'] = 1;
    }

    String wheredata = jsonEncode(where);

    Navigator.pushNamed(context, 'classify', arguments: {
      'name': name,
      'where': wheredata,
    });

    setState(() {
      keyworde = '';
    });
  }

  void collection(int id, int index) {
    Map<String, dynamic> data = {
      'goods_id': id,
    };

    ApiClient().goodscollection(data).then((res) {
      if (res.status) {
        successToShow(res.msg);
        setState(() {
          featurednlist[index]['isfav'] = !featurednlist[index]['isfav'];
        });
      }
    }).catchError((err) {
      if (err.status == false && err.data == 14006) {
        setState(() {
          showlist = true;
        });
      }
    });
  }




  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShopGoodsScrollView();
  }
}
