import 'package:atest/cart/cart.dart';
import 'package:atest/wishlist/wishlist.dart';
import 'package:atest/mine/mine.dart';
import 'package:atest/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'language/current_locale.dart';
import 'my_chart.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
    child: ShoppingApp(),
  ));
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(750, 1624), // 设计稿尺寸（宽度和高度）
      minTextAdapt: false, // 不允许字体缩放
    );

    return Consumer<CurrentLocale>(builder: (context, currentLocale, _) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          S.delegate
        ],
        locale: currentLocale.value,
        title: "nihao",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _currentIndex = 0;
  final List<Widget> _pages = [
    // 添加您的页面组件
    ShopPage(),
    WishListPage(),
    Cart(),
    Mine(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          backgroundColor: Color(0xff072D8C),
          actions: <Widget>[
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child:
                        Image.asset('assets/images/image/icon-1.png', width: 37.w)),
                SizedBox(width: 28.w),
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child:
                        Image.asset('assets/images/image/icon-2.png', width: 37.w)),
                SizedBox(width: 28.w),
                GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child:
                        Image.asset('assets/images/image/icon-3.png', width: 37.w)),
                SizedBox(width: 34.w),
              ],
            ),
          ],
          leadingWidth: 150,
          leading: Container(
            width: 120,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    // 图片点击后执行的代码
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  child:
                  Container(
                      padding:EdgeInsets.only(left:30.w,right: 10.w) ,
                      child: Icon(Icons.menu, color: Colors.white)),
                ),
                Image.asset('assets/images/image/icon-logo.png', width: 113.w),
              ],
            ),
          )),
      /*
      body:  IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),*/

      body: _pages[_currentIndex],
      drawer: AppDrawer(),
      // 添加侧边栏
      endDrawer: CartDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mine',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

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
