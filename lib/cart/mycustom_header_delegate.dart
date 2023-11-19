import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0; // 自定义头部的最小高度

  @override
  double get maxExtent => 50.0; // 自定义头部的最大高度

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // 构建自定义头部的内容
    return Container(
      color: Colors.blue, // 自定义头部的背景颜色
      child: Center(
        child: Text(
          '固定的自定义头部',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // 在需要重建自定义头部时返回true，否则返回false
    return false;
  }
  @override
  bool get floating => true; // 将头部设置为底部常驻

}