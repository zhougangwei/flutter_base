import 'package:flutter/material.dart';

import '../my_chart.dart';
import 'app_drawer.dart';
import 'custom_app_bar.dart';

class CustomScafflold extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BottomNavigationBar? bottomNavigationBar;
  Widget? body;

  CustomScafflold({this.bottomNavigationBar, this.body});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
        drawer: AppDrawerWidget(),
        body: this.body,
        bottomNavigationBar: this.bottomNavigationBar);
  }
}
