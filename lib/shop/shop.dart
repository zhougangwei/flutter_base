import 'dart:convert';

import 'package:abce/shop/shop_goods_scrollview.dart';
import 'package:abce/utils/common_utils.dart';
import 'package:flutter/material.dart';
import '../network/user.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with AutomaticKeepAliveClientMixin {
  String _netType = "";

  @override
  void initState() {
    super.initState();

    // 设置网络变化监听
    connectListener();
    // 获取网络连接状态
    getConnectType();
  }

  void getConnectType() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if (connectResult == ConnectivityResult.mobile) {
      _netType = "4G";
    } else if (connectResult == ConnectivityResult.wifi) {
      _netType = "wifi";
    } else {
      _netType = "未连接";
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("_netType" + _netType);
    return ShopGoodsScrollView();
  }
  @override
  bool get wantKeepAlive => true;

  /// 判断网络是否连接
  Future<bool> isConnected() async {
    var connectResult = await (Connectivity().checkConnectivity());
    return connectResult != ConnectivityResult.none;
  }

  /// 设置网络切换监听
  connectListener() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print("_netType---"+_netType);
      setState(() {});
    });
  }
}
