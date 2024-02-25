import 'dart:convert';

import 'package:abce/shop/bean/balance_bean_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../eventbus/eventbus.dart';
import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/login_controller.dart';
import '../login/login_locale.dart';
import '../login/login_page.dart';
import '../network/user.dart';
import '../shop/bean/order_bean_entity.dart';
import '../shop/bean/user_info_entity.dart';
import '../utils/common_utils.dart';
import '../utils/sp_utils.dart';
import 'balance.dart';
import 'exit_account.dart';
import 'login_out.dart';
import 'orderinfo.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  UserInfoEntity? userinfo;
  List<dynamic>? couponlist;
  List<BalanceBeanEntity> balancelist = [];
  ScrollController _scrollController1 = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  bool _isLoading = false;
  List<OrderBeanList>? orderlist;
  var datapost = {"page": 1, "limit": "50"};
  int pageNum = 1;
  int currentPage = 0;

  @override
  void initState() {
    orderlist = [];
    couponlist = [];
    balancelist = [];
    if (!LoginStatus.hasLogin()) {
      getbalancelist();
    }else{
      afterLogin();
    }
    print('initMinePage');
    bus.on("Login", loginState);
    _scrollController1.addListener(_handleScroll);
    _scrollController2.addListener(_handleScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController1.removeListener(_handleScroll);
    _scrollController2.removeListener(_handleScroll);
    bus.off("Login", loginState);

    super.dispose();
  }

  void _handleScroll() {
    if (_isLoading) {
      return; // 避免重复加载
    }
    if (currentPage == 1) {
      if (_scrollController1.position.pixels ==
          _scrollController1.position.maxScrollExtent) {
        _isLoading = true; // 标记为正在加载中，防止重复触发加载操作
        _loadMoreData(); // 加
        print('加载更多');
      }
    } else if (currentPage == 2) {
      if (_scrollController2.position.pixels ==
          _scrollController2.position.maxScrollExtent) {
        _isLoading = true; // 标记为正在加载中，防止重复触发加载操作
        _loadMoreData(); // 加
        print('加载更多');
      }
    }
  }

  void _loadMoreData() {
    pageNum++;
    this.datapost['page'] = pageNum.toString();
    if (currentPage == 1) {
      getbalancelist();
    } else if (currentPage == 2) {
      getorderlist();
    }
  }

  void loginState(arg) {
    if (!arg) {
      setState(() {
        orderlist = [];
        couponlist = [];
        balancelist = [];
        userinfo = null;
      });
    } else {
      afterLogin();
    }
  }

  void afterLogin() {
    getbalancelist();
    getcouponlist();
    getorderlist();
    getuserinfo();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final localizations = S.of(context);
    return DefaultTabController(
        length: 3, // 选项卡的数量
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(550.h),
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Container(
                  height: 421.h,
                  alignment: Alignment.center,
                  color: Color(0xffE8EBFC),
                  child: Stack(
                    children: [
                      obtainLoginOut(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 33.h),
                          if (userinfo != null)
                            GestureDetector(
                              onTap: () {
                                chooseImg();
                              },
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  height: 188.w,
                                  width: 188.w,
                                  fit: BoxFit.cover,
                                  imageUrl: userinfo!.avatar,
                                  placeholder: (context, url) => Icon(
                                      Icons.account_circle,
                                      size: 188.w,
                                      color: Color(0x33333333)),
                                  errorWidget: (context, url, error) => Icon(
                                      Icons.account_circle,
                                      size: 188.w,
                                      color: Color(0x33333333)),
                                ),
                              ),
                            )
                          else
                            GestureDetector(
                              onTap: () {
                               LoginController().showLogin(context);
                              },
                              child: ClipOval(
                                child: Icon(Icons.account_circle,
                                    size: 188.w, color: Color(0x33333333)),
                              ),
                            ),
                          SizedBox(height: 14.h),
                          Text(userinfo?.nickname ?? "",
                              style: TextStyle(
                                  color: Color(0xff333333), fontSize: 32.sp)),
                          SizedBox(height: 33.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => BalancePage()),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Text("\$" + (userinfo?.balance ?? "0.0"),
                                          style: TextStyle(
                                              color: Color(0xffFB641B),
                                              fontSize: 36.sp)),
                                      Text(localizations.balance,
                                          style: TextStyle(
                                              color: Color(0xff333333),
                                              fontSize: 24.sp))
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text((userinfo?.wishlist ?? 0).toString(),
                                        style: TextStyle(
                                            color: Color(0xffFB641B),
                                            fontSize: 36.sp)),
                                    Text(localizations.wishlist,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp))
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text((userinfo?.cart ?? 0).toString(),
                                        style: TextStyle(
                                            color: Color(0xffFB641B),
                                            fontSize: 36.sp)),
                                    Text(localizations.cart,
                                        style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp))
                                  ],
                                )
                              ])
                        ],
                      )
                    ],
                  )),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100.h),
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  indicatorColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  tabs: [
                    Tab(
                        child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(localizations.my,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                          Text(localizations.coupon,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                        ],
                      ),
                    )),
                    Tab(
                        child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(localizations.recharge,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                          Text(localizations.record,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                        ],
                      ),
                    )),
                    Tab(
                        child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(localizations.order,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                          Text(localizations.record,
                              style: TextStyle(
                                  fontSize: 28.sp, color: Color(0xff333333))),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              obtainCoupon(localizations),
              obtainRecharge(localizations),
              obtainOrder(localizations),
            ],
          ),
        ));
  }

  editavatar(data) {
    //修改头像
    String avatar = data['url'];
    ApiClient().changeavatar({"avatar": avatar}).then((res) {
      if (res['status']) {
        setState(() {
          successToShow(res['msg']);
          userinfo?.avatar = res['data']['avatar'];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  editinfo() {
    //修改个人信息
    ApiClient().editinfo({"nickname": userinfo?.username ?? ""}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert.convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  getuserinfo() {
    ApiClient().getuserinfo({}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert.convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  obtainCoupon(S localizations) {
    return Container(child: Center(child: Text("")));
  }

  obtainRecharge(S localizations) {
    return CustomScrollView(
        physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
        slivers: [
          buildRecharge(),
        ]);
  }

  obtainOrder(S localizations) {
    return CustomScrollView(
        controller: _scrollController2,
        physics: ClampingScrollPhysics(), // 可选的，设置滚动物理属性
        slivers: [
          buildOrderList(localizations),
        ]);
  }

  buildOrderList(S localizations) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          var item = orderlist?[index];
          if (item == null) {
            return Container();
          }
          return Container(
              padding: EdgeInsets.all(20.w),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      localizations.total + ":",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 25.w),
                    Text(
                      '\$${item.orderAmount}',
                      style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 15.w),
                    GestureDetector(
                        child: Container(
                            padding: EdgeInsets.all(10.w),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              localizations.viewDetails,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OrderInfoPage(ids: item.orderId)),
                          );
                          Navigator.pushNamed(context, 'orderdetails',
                              arguments: {'order_id': item.orderId});
                        }),
                    Expanded(child: Container()),
                    Builder(builder: (context) {
                      if (item.status == 1 && item.payStatus == 1) {
                        return GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(10.w),
                              color: Color(0xffFB641B),
                              child: Text(localizations.payNow,
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ),
                            onTap: () {
                              payorder(item.orderId);
                            });
                      } else {
                        return Container();
                      }
                    }),
                  ]),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: item.items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: it.imageUrl, width: 150.w),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          it.name,
                                          maxLines: 2,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Color(0xff333333),
                                            fontSize: 24.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5.w),
                                    color: Color(0x33999999),
                                    child: Text(
                                      it.addon,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Color(0xff333333),
                                        fontSize: 20.sp,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '${it.nums}×${it.price}',
                                      maxLines: 1,
                                      textAlign: TextAlign.right,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ));
        },
        childCount: orderlist?.length ?? 0,
      ),
    );
  }

  void getcouponlist() {
    ApiClient().usercoupon(datapost).then((res) {
      if (res['status']) {
        setState(() {
          couponlist =
              jsonConvert.convertList<List<dynamic>>(res['data']) ?? [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  void getorderlist() {
    ApiClient().getorderlist(datapost).then((res) {
      if (res['status']) {
        OrderBeanEntity? order =
            jsonConvert.convert<OrderBeanEntity>(res['data']);
        setState(() {
          orderlist?.addAll(order?.list ?? []);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  getbalancelist() {
    //充值记录
    ApiClient().getbalancelist(datapost).then((res) {
      if (res['status']) {
        setState(() {
          balancelist =
              jsonConvert.convertListNotNull<BalanceBeanEntity>(res['data']) ??
                  [];
        });
      } else {
        if (res['data'] == 14007 || res['data'] == 14006) {
            LoginController().showLogin(context);
        }
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  bool get wantKeepAlive => false;

  Future<void> chooseImg() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      submitImage(image.path);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Text(
                      "Album",
                      style: TextStyle(color: Colors.black, fontSize: 32.sp),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0x99999999),
                  thickness: 1.h,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      submitImage(image.path);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Text(
                      "Camera",
                      style: TextStyle(color: Colors.black, fontSize: 32.sp),
                    ),
                  ),
                ),
                Divider(
                  color: Color(0x33999999),
                  thickness: 20.h,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.h),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black, fontSize: 32.sp),
                    ),
                  ),
                )
              ]);
        });
  }

  void submitImage(String image) async {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 40.h),
                          SpinKitRotatingCircle(
                            color: Color(0x99999999),
                            size: 100.w,
                          ),
                          SizedBox(height: 30.h),
                          Text("Loading...",
                              style: TextStyle(
                                  color: Color(0x99999999),
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w500))
                        ],
                      )),
                )),
          );
        });

    String url = 'https://abcadm.cc/api.html';
    String filePath = image;
    String fileType = 'image';
    String name = 'file';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'multipart/form-data';

    var file = await http.MultipartFile.fromPath(name, filePath,
        contentType: MediaType('image', 'jpeg'));

    request.files.add(file);
    request.fields['method'] = 'images.upload';
    request.fields['upfile'] = filePath;

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var uploadFileRes = json.decode(responseBody);
        editavatar(uploadFileRes['data']);
        print(uploadFileRes);
      } else {
        // Handle request failure
      }
    } catch (error) {
      // Handle error
    } finally {
      // Hide loading after a delay
      Future.delayed(Duration(milliseconds: 250), () {});
    }
  }

  buildRecharge() {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: balancelist.length,
            (context, index) {
      var item = balancelist[index];
      if (item == null) {
        return Container();
      }
      return Column(
        children: [
          Divider(color: Colors.grey, thickness: 1.h),
          Container(
              padding: EdgeInsets.only(
                  left: 35.w, top: 20.h, right: 45.w, bottom: 20.w),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.memo,
                          style: TextStyle(
                              fontSize: 24.sp,
                              color: Color(0xff333333),
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(item.ctime,
                          style: TextStyle(
                              fontSize: 22.sp, color: Color(0xff999999))),
                    ],
                  ),
                  Text('\$${item.money}',
                      style: TextStyle(
                          fontSize: 30.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                ],
              )),
        ],
      );
    }));
  }

  Future<void> loginOut() async {
    bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return ExitDialog();
      },
    );

    if (confirm == true) {
      SPUtils.setString('token', '');
      bus.emit('Login', false);
    }
  }

  Widget obtainLoginOut() {
    if (LoginStatus.hasLogin()) {
      return Positioned(
        right: 0,
        top: 0,
        child: GestureDetector(
          onTap: () {
            loginOut();
          },
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Icon(Icons.login, size: 65.w, color: Color(0xff333333)),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  void payorder(order_id) {
    var data = {
      "ids": order_id,
      "payment_code": 'balancepay',
      "payment_type": 1, //1=>订单支付，2=>充值
    };

    ApiClient().payorder(data).then((res) {
      if (res["status"]) {
        getorderlist();
      }
      successToShow(res['msg']);
    }).catchError((err) {
      err.toString();
    });
  }
}
