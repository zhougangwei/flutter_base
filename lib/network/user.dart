import 'api.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();

  Future openbanner(Map<String, dynamic> params) async {
    params['method'] = 'advert.getAdvertList';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future getTypeList(Map<String, dynamic> params ) async {
    params['method'] = 'goodsType.goodsTypeList';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future getGoodsCat(Map<String, dynamic> params) async {
    params['method'] = 'goodsType.getGoodsCat';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future getfaqlist(Map<String, dynamic> params) async {
    params['method'] = 'faq.list';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future addMessage(Map<String, dynamic> params) async {
    params['method'] = 'sendMessage.addMessage';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future editinfo(Map<String, dynamic> params) async {
    params['method'] = 'user.editinfo';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
  Future upload(Map<String, dynamic> params) async {
    params['method'] = 'images.upload';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future changeavatar(Map<String, dynamic> params) async {
    params['method'] = 'user.changeavatar';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
  Future getPageList(Map<String, dynamic> params) async {
    params['method'] = 'goods.getPageList';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future passwordlogin(Map<String, dynamic> params) async {
    params['method'] = 'user.login';
    return await post(url: url, params: params, auth: false);
  }

  Future login(Map<String, dynamic> params) async {
    params['method'] = 'user.smsEmail';
    return await post(url: url, params: params, auth: false);
  }

  Future userSms(Map<String, dynamic> params) async {
    params['method'] = 'user.emailSms';
    return await post(url: url, params: params, auth: false);
  }

  Future forgetpwd(Map<String, dynamic> params) async {
    params['method'] = 'user.forgetpwd';
    return await post(url: url, params: params, auth: false);
  }
  // no use
  Future getbrief(Map<String, dynamic> params) async {
    params['method'] = 'articles.getArticleDetail';
    return await post(url: url, params: params, auth: false, showToast: false);
  }
  //todo
  Future getgoodscomment(Map<String, dynamic> params) async {
    params['method'] = 'goods.getgoodscomment';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future getgoodsparams(Map<String, dynamic> params) async {
    params['method'] = 'goods.getgoodsparams';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future getdetial(Map<String, dynamic> params) async {
    params['method'] = 'goods.getdetial';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future relatedlist(Map<String, dynamic> params) async {
    params['method'] = 'goods.getlist';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

  Future goodscollection(Map<String, dynamic> params) async {
    params['method'] = 'user.goodscollection';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future CatoPeration(Map<String, dynamic> params) async {
    params['method'] = 'cart.getlist';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future getuserdefaultship(Map<String, dynamic> params) async {
    params['method'] = 'user.getuserdefaultship';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

  Future AddShip(Map<String, dynamic> params) async {
    params['method'] = 'cartShip.AddShip';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 删除购物车item
  Future<dynamic> delShip(Map<String, dynamic> params) async {
    params?['method'] = 'cartShip.delShip';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 删除购物车item
  Future<dynamic> catdel(Map<String, dynamic> params) async {
    params?['method'] = 'cart.del';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
// 修改购物车数量
  Future<dynamic> setnums(Map<String, dynamic> params) async {
    params?['method'] = 'cart.setnums';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
// 添加购物车
  Future<dynamic> cartadd(Map<String, dynamic> params) async {
    params?['method'] = 'cart.add';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 创建订单
  Future<dynamic> createorder(Map<String, dynamic> params) async {
    params?['method'] = 'order.create';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 支付订单
  Future<dynamic> payorder(Map<String, dynamic> params) async {
    params?['method'] = 'user.pay';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
// 获取支付的二维码
  Future<dynamic> createcode(Map<String, dynamic> params) async {
    params?['method'] = 'user.create';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 查看订单详情
  Future<dynamic> orderdetails(Map<String, dynamic> params) async {
    params?['method'] = 'order.details';
    return await post(url: url, params: params, auth: true, showToast: false);
  }


// 获取用户收藏列表
  Future<dynamic> goodscollectionlist(Map<String, dynamic> params) async {
    params?['method'] = 'user.goodscollectionlist';
    return await post(url: url, params: params, showToast: false);
  }
// 切换商品规格
  Future<dynamic> getProductInfo(Map<String, dynamic> params) async {
    params?['method'] = 'goods.getproductinfo';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

// 获取底部信息
  Future<dynamic> getSettingList(Map<String, dynamic> params) async {
    params?['method'] = 'user.getSettingList';
    return await post(url: url, params: params, auth: false, showToast: false);
  }


// 优惠券列表
  Future<dynamic> couponlist(Map<String, dynamic> params) async {
    params['method'] = 'coupon.couponlist';
    return await post(url: url, params: params, auth: true, showToast: false);
  }
  //todo
// 领取优惠券
  Future<dynamic> getcoupon(Map<String, dynamic> params) async {
    params['method'] = 'coupon.getcoupon';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 专题活动
  Future<dynamic> getPromotionType(Map<String, dynamic> params) async {
    params['method'] = 'promotion.getPromotionType';
    return await post(url: url, params: params, auth: false, showToast: false);
  }

// 个人信息
  Future<dynamic> getuserinfo(Map<String, dynamic> params) async {
    params['method'] = 'user.info';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 我的优惠券
  Future<dynamic> usercoupon(Map<String, dynamic> params) async {
    params['method'] = 'coupon.usercoupon';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 充值记录
  Future<dynamic> getbalancelist(Map<String, dynamic> params) async {
    params['method'] = 'user.balancelist';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 订单记录
  Future<dynamic> getorderlist(Map<String, dynamic> params) async {
    params['method'] = 'order.getorderlist';
    return await post(url: url, params: params, auth: true, showToast: false);
  }

// 获取购物车总价
  Future<dynamic> getAmount(Map<String, dynamic> params) async {
    params['method'] = 'cart.getAmount';
    return await post(url: url, params: params, auth: false, showToast: false);
  }



// 获取图片验证码
  Future<dynamic> sendCaptcha(Map<String, dynamic> params) async {
    params['method'] = 'user.sendCaptcha';
    return await post(url: url, params: params, auth: false, showToast: false);
  }
}
