import 'dart:convert';

import 'package:abce/cart/cart.dart';
import 'package:abce/network/user.dart';
import 'package:abce/shop/shop_goods_scrollview.dart';
import 'package:abce/update/update_dialog.dart';
import 'package:abce/utils/sp_utils.dart';
import 'package:abce/widget/app_drawer.dart';
import 'package:abce/widget/custom_app_bar.dart';
import 'package:abce/wishlist/wishlist.dart';
import 'package:abce/mine/mine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:r_upgrade/r_upgrade.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io' show Platform;
import 'generated/l10n.dart';
import 'language/current_locale.dart';
import 'login/page_controller_provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  SPUtils.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => CurrentLocale()),
      ChangeNotifierProvider(create: (context) => PageControllerProvider()),
    ],
    child: ShoppingApp(),
  ));
}

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
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
  @override
  void initState() {
    print('AACCDD执行了MainPage initState');
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      upgrade(context);
    });
  }

  Future<void> upgrade(BuildContext scontext) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    print("version:" + version);
    String type = Platform.isAndroid
        ? "1"
        : Platform.isIOS
            ? '2'
            : '3';
    ApiClient().checkUpdate({'version': version, 'type': type}).then((res) {
        if (res != null&& res['status'] == false) {
          showDialog(
            context: scontext,
            builder: (BuildContext context) {
              return UpdateDialog(
                message:
                    'A new version is available, please update to the latest version for a better experience.',
                onConfirm: () {
                  Navigator.of(context).pop();
                  upgradeFromUrl();
                },
              );
            },
          );
        }
    });
  }

  void upgradeFromUrl() async {
    if (Platform.isIOS) {
      bool? isSuccess = await RUpgrade.upgradeFromAppStore(
        '您的AppId', //例如:微信的AppId:414478124
      );
    } else if (Platform.isAndroid) {
      int? id = await RUpgrade.upgrade(
        'https://raw.githubusercontent.com/rhymelph/r_upgrade/master/apk/app-release.apk',
        fileName: 'app-release.apk',
        installType: RUpgradeInstallType.normal,
      );
      if (id != null) {
        RUpgrade.install(id);
      }
    }
  }

  final List<Widget> _pages = [
    // 添加您的页面组件
    ShopGoodsScrollView(),
    WishListPage(),
    CartPage(),
    MinePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      Provider.of<PageControllerProvider>(context, listen: false)
          .pageController
          .jumpToPage(index);
    });
  }

  late WebViewController controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    return Consumer<PageControllerProvider>(builder: (context, provider, _) {
      return Stack(
        children: <Widget>[
          Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(scaffoldKey: _scaffoldKey),
            drawer: AppDrawerWidget(scaffoldKey: _scaffoldKey),
            body: PageView(
                controller: provider.pageController, //初始化的PageController
                children: _pages,
                onPageChanged: (index) {
                  provider.currentPageIndex = index;
                }),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                _onTabTapped(index);
              },
              currentIndex: provider.currentPageIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/img/indexicon_w.png',
                      width: 55.w),
                  activeIcon: Image.asset('assets/images/img/indexicon.png',
                      width: 55.w),
                  label: local.shop,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/img/shoucangicon_w.png',
                      width: 55.w),
                  activeIcon: Image.asset('assets/images/img/shoucangicon.png',
                      width: 55.w),
                  label: local.wishlist,
                ),
                BottomNavigationBarItem(
                    icon: Image.asset('assets/images/img/caricon_w.png',
                        width: 55.w),
                    activeIcon: Image.asset('assets/images/img/caricon.png',
                        width: 55.w),
                    label: local.cart),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/images/img/usericon_w.png',
                      width: 55.w),
                  activeIcon: Image.asset('assets/images/img/usericon.png',
                      width: 55.w),
                  label: local.user,
                ),
              ],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
            ),
          ),
          Positioned(
              right: 30.w,
              bottom: 130.w,
              child: GestureDetector(
                  onTap: () {
                    showHelp(context);
                  },
                  child: Image.asset('assets/images/image/message.png',
                      width: 100.w)))
        ],
      );
    });
  }

  void showHelp(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext dialogcontext) {
          return Material(
            type: MaterialType.transparency,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(color: Colors.transparent),
                  )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: 1200.h,
                        width: double.infinity,
                        child: WebView(
                          initialUrl: "https://chat.ssrchat.com/service/fh41w6",
                          javascriptMode: JavascriptMode.unrestricted,
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
