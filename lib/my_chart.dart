import 'package:atest/shopping_list_item.dart';
import 'package:flutter/material.dart';

import 'eventbus/eventbus.dart';
import 'login/login_page.dart';

class CartDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('My Cart'),
            onTap: () {
              Navigator.pop(context); // 关闭侧边栏
              // 处理导航到Shop页面的逻辑
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return LoginPopup(onPressed: () {
                    Navigator.of(context).pop();
                    bus.emit('Login', "hello PageA from PageB");
                  });
                });
            },
          ),
          ShoppingListItem(
            imagePath: "",
            itemName: "1",
            itemPrice: "1.11",
          )

        ],
      ),
    );
  }
}