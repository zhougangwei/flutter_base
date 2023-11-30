import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../eventbus/eventbus.dart';
import '../generated/json/base/json_convert_content.dart';
import '../generated/l10n.dart';
import '../login/login_locale.dart';
import '../network/user.dart';
import '../shop/bean/order_bean_entity.dart';
import '../shop/bean/user_info_entity.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  UserInfoEntity? userinfo;
  String? username;
  List<dynamic>? couponlist;
  List<dynamic>? balancelist;
  List<OrderBeanList>? orderlist;
  var datapost = {"page": 1, "limit": "10"};

  @override
  void initState() {
    orderlist= [];
    couponlist= [];
    balancelist= [];
    afterLogin();
    bus.on("Login", (arg) {
      afterLogin();
    });
    super.initState();
  }

  void afterLogin() {
    if (LoginStatus.hasLogin()) {
      getbalancelist();
      getcouponlist();
      getorderlist();
      getuserinfo();
    }
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 33.h),
                      if (userinfo != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(188.h),
                          child: GestureDetector(
                            onTap: () {
                                chooseImg();
                              },
                            child: CachedNetworkImage(
                              imageUrl: userinfo!.avatar,
                              width: 188.w,
                              height: 188.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      else
                        Container(
                          color: Colors.red,
                          width: 188.w,
                          height: 188.h,
                        ),
                      SizedBox(height: 14.h),
                      Text(userinfo?.nickname??"",
                            style: TextStyle(
                                color: Color(0xff333333), fontSize: 32.sp)),
                      SizedBox(height: 33.h),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
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
                  )),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(100.h),
                child: TabBar(
                  indicatorColor: Colors.white ,
                  padding: EdgeInsets.all(0),
                  tabs: [
                    Tab(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(localizations.my,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
                              Text(localizations.coupon,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
                            ],
                          ),
                        )),
                    Tab(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(localizations.recharge,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
                              Text(localizations.record,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
                            ],
                          ),
                        )),
                    Tab(
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(localizations.order,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
                              Text(localizations.record,
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Color(0xff333333))),
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
    Map<String, dynamic> datapost = jsonDecode(data);
    String avatar = datapost['data']['url'];
    ApiClient().changeavatar({"avatar":avatar}).then((res) {
      if (res['status']) {
        setState(() {
          userinfo = jsonConvert.convert<UserInfoEntity>(res['data']);
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  editinfo() {
    //修改个人信息
    ApiClient().editinfo({"nickname": this.username}).then((res) {
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
    return Container(child:Center(child: Text(localizations.coupon)));
  }

  obtainRecharge(S localizations) {
    return Container(child:Center(child: Text(localizations.recharge)));
  }


  obtainOrder(S localizations) {
    return CustomScrollView(
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
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                      children: [
                        Text(
                          localizations.total,
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          item.orderAmount,
                          style: TextStyle(
                              color: Color(0xff333333),
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(child: Container(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            child: Text(localizations.viewDetails)),onTap: () {}),
                        Expanded(child: Container()),
                        GestureDetector(child: Container(
                            color: Theme
                                .of(context)
                                .primaryColor,
                            child: Text(localizations.payNow)),onTap: () {}),
                      ]
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: item.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      var it = item.items[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CachedNetworkImage(imageUrl: it.imageUrl,width: 150.w),
                            SizedBox(height: 15),
                            Column(
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
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  it.addon,
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${it.nums}×${it.price}',
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Color(0xff333333),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
        OrderBeanEntity? order = jsonConvert.convert<OrderBeanEntity>(
            res['data']);
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
              jsonConvert.convertList<List<dynamic>>(res['data']) ?? [];
        });
      }
    }).catchError((err) {
      err.toString();
    });
  }

  @override
  bool get wantKeepAlive => true;



  Future<void> chooseImg() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      submitImage(image.path);
    } else {

    }
  }


  void submitImage(String image) async {
    String url = 'https://abcadm.cc/api.html';
    String filePath = image;
    String fileType = 'image';
    String name = 'file';

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'multipart/form-data';

    var file = await http.MultipartFile.fromPath(name, filePath,
        contentType: MediaType.parse(fileType));

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
      Future.delayed(Duration(milliseconds: 250), () {
        // Hide loading
      });
    }
  }
}
