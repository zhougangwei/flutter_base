import 'dart:convert';

import 'package:atest/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../network/api.dart';
import '../network/user.dart';
import 'good_cast_list.dart';

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
  var datapost = {
    "page": 1,
    "limit": 4
  };

  void getPageList() {
    HttpClient().getPageList({}).then((res) {
      if (res.status) {
        setState(() {
          PageList = res.data.list;
        });
      }
    }).catchError((err) {
      // Handle error
    });
  }

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

    HttpClient().goodscollection(data).then((res) {
      if (res.status) {
        CommonUtils.successToShow(res.msg);
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

  void relatedlist() {
    Map<String, dynamic> data = this.datapost;
    Map<String, dynamic> type = {
      'recommend': 1,
    };
    data['where'] = jsonEncode(type);

    HttpClient().relatedlist(data).then((res) {
      if (res.status) {
        setState(() {
          featurednlist.addAll(res.data.list);
        });
      }
    }).catchError((err) {
      // Handle error
    });
  }

  void getTypeList() {
    HttpClient().getTypeList({}).then((res) {
      if (res.status) {
        setState(() {
          TypeList = res.data;
        });
      }
    }).catchError((err) {
      // Handle error
    });
  }

  @override
  void initState() {
    super.initState();
    //getPageList();
    //getTypeList();
    //relatedlist();
  }

  @override
  Widget build(BuildContext context) {
    return
          GoodCastList();

  }
}