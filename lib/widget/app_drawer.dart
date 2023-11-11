
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.pop(context); // 关闭侧边栏
              // 处理导航到Shop页面的逻辑
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Wishlist'),
            onTap: () {
              Navigator.pop(context);
              // 处理导航到Wishlist页面的逻辑
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              Navigator.pop(context);
              // 处理导航到Cart页面的逻辑
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mine'),
            onTap: () {
              Navigator.pop(context);
              // 处理导航到Mine页面的逻辑
            },
          ),
        ],
      ),
    );
  }
}