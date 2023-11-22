import 'package:atest/cart/cart.dart';
import 'package:atest/login/login_locale.dart';
import 'package:atest/shop/shop_goods_scrollview.dart';
import 'package:atest/sp/sp_utils.dart';
import 'package:atest/widget/app_drawer.dart';
import 'package:atest/widget/custom_app_bar.dart';
import 'package:atest/widget/custom_scaffoldr.dart';
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
  SPUtils.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CurrentLocale()),
      ChangeNotifierProvider(create: (context) => LoginStatus()),
    ],
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
          primaryColor: Color(0xff072D8C),
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
  int _currentIndex = 0;
  final List<Widget> _pages = [
    // 添加您的页面组件
    ShopGoodsScrollView(),
    WishListPage(),
    CartPage(),
    MinePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
      drawer: AppDrawer(),
      endDrawer: CartDrawer(),
      body:  IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/img/indexicon_w.png', width: 55.w),
            activeIcon:
                Image.asset('assets/images/img/indexicon.png', width: 55.w),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/img/shoucangicon_w.png',
                width: 55.w),
            activeIcon:
                Image.asset('assets/images/img/shoucangicon.png', width: 55.w),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/img/caricon_w.png', width: 55.w),
            activeIcon:
                Image.asset('assets/images/img/caricon.png', width: 55.w),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/img/usericon_w.png', width: 55.w),
            activeIcon:
                Image.asset('assets/images/img/usericon.png', width: 55.w),
            label: 'Mine',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
