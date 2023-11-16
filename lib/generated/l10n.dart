// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `WELCOME TO OUR STORE!`
  String get welcome {
    return Intl.message(
      'WELCOME TO OUR STORE!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `USER`
  String get user {
    return Intl.message(
      'USER',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get faq {
    return Intl.message(
      'FAQ',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT US`
  String get countatUs {
    return Intl.message(
      'CONTACT US',
      name: 'countatUs',
      desc: '',
      args: [],
    );
  }

  /// `SHOP BY PRODUCT`
  String get dartment {
    return Intl.message(
      'SHOP BY PRODUCT',
      name: 'dartment',
      desc: '',
      args: [],
    );
  }

  /// `LIMITED TIME DISCOUNT`
  String get timeDiscount {
    return Intl.message(
      'LIMITED TIME DISCOUNT',
      name: 'timeDiscount',
      desc: '',
      args: [],
    );
  }

  /// `THEMATIC ACTIVITIES`
  String get activities {
    return Intl.message(
      'THEMATIC ACTIVITIES',
      name: 'activities',
      desc: '',
      args: [],
    );
  }

  /// `VOUCHER CENTER`
  String get vouchier {
    return Intl.message(
      'VOUCHER CENTER',
      name: 'vouchier',
      desc: '',
      args: [],
    );
  }

  /// `BRAND AREA`
  String get brand {
    return Intl.message(
      'BRAND AREA',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `CHECKOUT`
  String get checkout {
    return Intl.message(
      'CHECKOUT',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Support for adding unified address`
  String get addAddressPS {
    return Intl.message(
      'Support for adding unified address',
      name: 'addAddressPS',
      desc: '',
      args: [],
    );
  }

  /// `Support to select multiple shipping addresses`
  String get multipleAddress {
    return Intl.message(
      'Support to select multiple shipping addresses',
      name: 'multipleAddress',
      desc: '',
      args: [],
    );
  }

  /// `YOUR ORDER`
  String get yourOrder {
    return Intl.message(
      'YOUR ORDER',
      name: 'yourOrder',
      desc: '',
      args: [],
    );
  }

  /// `SUBTTOTAL`
  String get subttotal {
    return Intl.message(
      'SUBTTOTAL',
      name: 'subttotal',
      desc: '',
      args: [],
    );
  }

  /// `PRODUCT`
  String get product {
    return Intl.message(
      'PRODUCT',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Delete the added address`
  String get deleteAddress {
    return Intl.message(
      'Delete the added address',
      name: 'deleteAddress',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Merchandise discount`
  String get goodsDiscount {
    return Intl.message(
      'Merchandise discount',
      name: 'goodsDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Order discount`
  String get orderDiscount {
    return Intl.message(
      'Order discount',
      name: 'orderDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Shipping`
  String get shipping {
    return Intl.message(
      'Shipping',
      name: 'shipping',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Have a coupon?`
  String get haveCoupon {
    return Intl.message(
      'Have a coupon?',
      name: 'haveCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Click here to enter your code`
  String get clickCode {
    return Intl.message(
      'Click here to enter your code',
      name: 'clickCode',
      desc: '',
      args: [],
    );
  }

  /// `Order notes (optional)`
  String get orderNote {
    return Intl.message(
      'Order notes (optional)',
      name: 'orderNote',
      desc: '',
      args: [],
    );
  }

  /// `PAYMENT METHOD`
  String get paymentMethod {
    return Intl.message(
      'PAYMENT METHOD',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `BALANCE PAYMENT`
  String get balancePayment {
    return Intl.message(
      'BALANCE PAYMENT',
      name: 'balancePayment',
      desc: '',
      args: [],
    );
  }

  /// `Your personal data will be used to process your order, supportyour experience throughout this website, and for other purposesdescribed in our privacy policy.`
  String get str1 {
    return Intl.message(
      'Your personal data will be used to process your order, supportyour experience throughout this website, and for other purposesdescribed in our privacy policy.',
      name: 'str1',
      desc: '',
      args: [],
    );
  }

  /// `If you have a coupon code, please apply it below.`
  String get str2 {
    return Intl.message(
      'If you have a coupon code, please apply it below.',
      name: 'str2',
      desc: '',
      args: [],
    );
  }

  /// `APPLY COUPON`
  String get useCoupon {
    return Intl.message(
      'APPLY COUPON',
      name: 'useCoupon',
      desc: '',
      args: [],
    );
  }

  /// `ADDRESS`
  String get address {
    return Intl.message(
      'ADDRESS',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `ADD ADDRESS`
  String get AddAddress {
    return Intl.message(
      'ADD ADDRESS',
      name: 'AddAddress',
      desc: '',
      args: [],
    );
  }

  /// `Modify Address`
  String get modifyAddress {
    return Intl.message(
      'Modify Address',
      name: 'modifyAddress',
      desc: '',
      args: [],
    );
  }

  /// `Country / Region`
  String get country {
    return Intl.message(
      'Country / Region',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Street address`
  String get street {
    return Intl.message(
      'Street address',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Town / City`
  String get city {
    return Intl.message(
      'Town / City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get state {
    return Intl.message(
      'State',
      name: 'state',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Zip Code`
  String get zipCode {
    return Intl.message(
      'Zip Code',
      name: 'zipCode',
      desc: '',
      args: [],
    );
  }

  /// `CONFIRM`
  String get Confirm {
    return Intl.message(
      'CONFIRM',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `PRICE`
  String get price {
    return Intl.message(
      'PRICE',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `QUANTITY`
  String get quantity {
    return Intl.message(
      'QUANTITY',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `SUBTOTAL`
  String get SubTotal {
    return Intl.message(
      'SUBTOTAL',
      name: 'SubTotal',
      desc: '',
      args: [],
    );
  }

  /// `CART TOTALS`
  String get cartTotal {
    return Intl.message(
      'CART TOTALS',
      name: 'cartTotal',
      desc: '',
      args: [],
    );
  }

  /// `PROCEED TO CHECKOUT`
  String get proceedCheckout {
    return Intl.message(
      'PROCEED TO CHECKOUT',
      name: 'proceedCheckout',
      desc: '',
      args: [],
    );
  }

  /// `all`
  String get all {
    return Intl.message(
      'all',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get outStock {
    return Intl.message(
      'Out of Stock',
      name: 'outStock',
      desc: '',
      args: [],
    );
  }

  /// `In Stock`
  String get stock {
    return Intl.message(
      'In Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `Cancel to Wishlist`
  String get CancelWishlist {
    return Intl.message(
      'Cancel to Wishlist',
      name: 'CancelWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Add to Wishlist`
  String get AddWishlist {
    return Intl.message(
      'Add to Wishlist',
      name: 'AddWishlist',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get Tags {
    return Intl.message(
      'Tags',
      name: 'Tags',
      desc: '',
      args: [],
    );
  }

  /// `ADD TO CART`
  String get addToCart {
    return Intl.message(
      'ADD TO CART',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `No comment`
  String get noComment {
    return Intl.message(
      'No comment',
      name: 'noComment',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get Rating {
    return Intl.message(
      'Rating',
      name: 'Rating',
      desc: '',
      args: [],
    );
  }

  /// `HOME / Thematic Activities`
  String get homeThemaActive {
    return Intl.message(
      'HOME / Thematic Activities',
      name: 'homeThemaActive',
      desc: '',
      args: [],
    );
  }

  /// `VIEW MORE`
  String get more {
    return Intl.message(
      'VIEW MORE',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `HOME / BLOG`
  String get homeBlog {
    return Intl.message(
      'HOME / BLOG',
      name: 'homeBlog',
      desc: '',
      args: [],
    );
  }

  /// `HOME / BRAND AREA`
  String get homeBrand {
    return Intl.message(
      'HOME / BRAND AREA',
      name: 'homeBrand',
      desc: '',
      args: [],
    );
  }

  /// `HOME / CONTACT US`
  String get homeContact {
    return Intl.message(
      'HOME / CONTACT US',
      name: 'homeContact',
      desc: '',
      args: [],
    );
  }

  /// `Send Us Message`
  String get sendMessage {
    return Intl.message(
      'Send Us Message',
      name: 'sendMessage',
      desc: '',
      args: [],
    );
  }

  /// `Contact us to get any support or help.`
  String get ContactUs {
    return Intl.message(
      'Contact us to get any support or help.',
      name: 'ContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Your Name（required）`
  String get yourName {
    return Intl.message(
      'Your Name（required）',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Your Email (required)`
  String get yourEmail {
    return Intl.message(
      'Your Email (required)',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get yourMessage {
    return Intl.message(
      'Your Message',
      name: 'yourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Get In Touch`
  String get getTouch {
    return Intl.message(
      'Get In Touch',
      name: 'getTouch',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pretium nisifeugiat nisi gravida,eget rutrum ligula placerat.Aenean id elit dolor. Suspendissemalesuada varius odio.`
  String get str3 {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pretium nisifeugiat nisi gravida,eget rutrum ligula placerat.Aenean id elit dolor. Suspendissemalesuada varius odio.',
      name: 'str3',
      desc: '',
      args: [],
    );
  }

  /// `Praesent efficitur, odio at dictum fringilla, leo dolor ornare nulla, quis.`
  String get str4 {
    return Intl.message(
      'Praesent efficitur, odio at dictum fringilla, leo dolor ornare nulla, quis.',
      name: 'str4',
      desc: '',
      args: [],
    );
  }

  /// `condimentum enim arcu id magna.Phasellus congue hendrerit dolor id commodo.Suspendisse potenti.`
  String get str5 {
    return Intl.message(
      'condimentum enim arcu id magna.Phasellus congue hendrerit dolor id commodo.Suspendisse potenti.',
      name: 'str5',
      desc: '',
      args: [],
    );
  }

  /// `Our Office`
  String get ourOffice {
    return Intl.message(
      'Our Office',
      name: 'ourOffice',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get Address {
    return Intl.message(
      'Address',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Working Hours`
  String get workHours {
    return Intl.message(
      'Working Hours',
      name: 'workHours',
      desc: '',
      args: [],
    );
  }

  /// `HOME / DISCOUNT`
  String get homeDiscount {
    return Intl.message(
      'HOME / DISCOUNT',
      name: 'homeDiscount',
      desc: '',
      args: [],
    );
  }

  /// `HOME / FAQ`
  String get homeFAQ {
    return Intl.message(
      'HOME / FAQ',
      name: 'homeFAQ',
      desc: '',
      args: [],
    );
  }

  /// `FEATURED PRODUCTS`
  String get featurendProdcts {
    return Intl.message(
      'FEATURED PRODUCTS',
      name: 'featurendProdcts',
      desc: '',
      args: [],
    );
  }

  /// `HOME / Voucher center`
  String get homeVoucher {
    return Intl.message(
      'HOME / Voucher center',
      name: 'homeVoucher',
      desc: '',
      args: [],
    );
  }

  /// `COUPON CENTER`
  String get couponCenter {
    return Intl.message(
      'COUPON CENTER',
      name: 'couponCenter',
      desc: '',
      args: [],
    );
  }

  /// `The more coupons you get, the more`
  String get str6 {
    return Intl.message(
      'The more coupons you get, the more',
      name: 'str6',
      desc: '',
      args: [],
    );
  }

  /// `money you save.`
  String get saveMoney {
    return Intl.message(
      'money you save.',
      name: 'saveMoney',
      desc: '',
      args: [],
    );
  }

  /// `Time limit`
  String get timeLimit {
    return Intl.message(
      'Time limit',
      name: 'timeLimit',
      desc: '',
      args: [],
    );
  }

  /// `Overlay use`
  String get overlayUse {
    return Intl.message(
      'Overlay use',
      name: 'overlayUse',
      desc: '',
      args: [],
    );
  }

  /// `Variety`
  String get variety {
    return Intl.message(
      'Variety',
      name: 'variety',
      desc: '',
      args: [],
    );
  }

  /// `MY COUPON`
  String get myCoupon {
    return Intl.message(
      'MY COUPON',
      name: 'myCoupon',
      desc: '',
      args: [],
    );
  }

  /// `GET IT NOW`
  String get getNow {
    return Intl.message(
      'GET IT NOW',
      name: 'getNow',
      desc: '',
      args: [],
    );
  }

  /// `RECEIVED`
  String get received {
    return Intl.message(
      'RECEIVED',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Crypto`
  String get crypto {
    return Intl.message(
      'Crypto',
      name: 'crypto',
      desc: '',
      args: [],
    );
  }

  /// `Alipay`
  String get alipay {
    return Intl.message(
      'Alipay',
      name: 'alipay',
      desc: '',
      args: [],
    );
  }

  /// `Bank Transfer`
  String get wireTransfer {
    return Intl.message(
      'Bank Transfer',
      name: 'wireTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Wishlist`
  String get wishlist {
    return Intl.message(
      'Wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `COPY VOUCHER`
  String get copyVoucher {
    return Intl.message(
      'COPY VOUCHER',
      name: 'copyVoucher',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `PAY NOW`
  String get payNow {
    return Intl.message(
      'PAY NOW',
      name: 'payNow',
      desc: '',
      args: [],
    );
  }

  /// `Modify Personal Data`
  String get modifyData {
    return Intl.message(
      'Modify Personal Data',
      name: 'modifyData',
      desc: '',
      args: [],
    );
  }

  /// `Modify your profile including avatars and nicknames, etc.`
  String get str7 {
    return Intl.message(
      'Modify your profile including avatars and nicknames, etc.',
      name: 'str7',
      desc: '',
      args: [],
    );
  }

  /// `My`
  String get my {
    return Intl.message(
      'My',
      name: 'my',
      desc: '',
      args: [],
    );
  }

  /// `Coupon`
  String get coupon {
    return Intl.message(
      'Coupon',
      name: 'coupon',
      desc: '',
      args: [],
    );
  }

  /// `Recharge`
  String get recharge {
    return Intl.message(
      'Recharge',
      name: 'recharge',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `ORDER DETAILS`
  String get orderDetails {
    return Intl.message(
      'ORDER DETAILS',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `ODD NUMBERS`
  String get oddNumbers {
    return Intl.message(
      'ODD NUMBERS',
      name: 'oddNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Order time`
  String get orderTime {
    return Intl.message(
      'Order time',
      name: 'orderTime',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get orderStatus {
    return Intl.message(
      'Order Status',
      name: 'orderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Undelivered`
  String get undelivered {
    return Intl.message(
      'Undelivered',
      name: 'undelivered',
      desc: '',
      args: [],
    );
  }

  /// `· Do not recharge any non-USDT to the current address, otherwise the asset will not arrive and cannot be retrieved.   · When recharging with the current address, the recharging amount will not be accounted until 15 network nodes confirm it.       · When recharging, please make sure to provide the correct ABC recharge address, otherwise the asset will not arrive and cannot be recovered.`
  String get str8 {
    return Intl.message(
      '· Do not recharge any non-USDT to the current address, otherwise the asset will not arrive and cannot be retrieved.   · When recharging with the current address, the recharging amount will not be accounted until 15 network nodes confirm it.       · When recharging, please make sure to provide the correct ABC recharge address, otherwise the asset will not arrive and cannot be recovered.',
      name: 'str8',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm the recharge information`
  String get str9 {
    return Intl.message(
      'Please confirm the recharge information',
      name: 'str9',
      desc: '',
      args: [],
    );
  }

  /// `Chain Name`
  String get chainName {
    return Intl.message(
      'Chain Name',
      name: 'chainName',
      desc: '',
      args: [],
    );
  }

  /// `Ethereum(ERC20)`
  String get ethereum {
    return Intl.message(
      'Ethereum(ERC20)',
      name: 'ethereum',
      desc: '',
      args: [],
    );
  }

  /// `Recharge address`
  String get rechargeAddress {
    return Intl.message(
      'Recharge address',
      name: 'rechargeAddress',
      desc: '',
      args: [],
    );
  }

  /// `COPY`
  String get copy {
    return Intl.message(
      'COPY',
      name: 'copy',
      desc: '',
      args: [],
    );
  }

  /// `RECHARGE`
  String get Recharge {
    return Intl.message(
      'RECHARGE',
      name: 'Recharge',
      desc: '',
      args: [],
    );
  }

  /// `Cash account`
  String get cashAccount {
    return Intl.message(
      'Cash account',
      name: 'cashAccount',
      desc: '',
      args: [],
    );
  }

  /// `HOME / My Wishlish`
  String get HomeMy {
    return Intl.message(
      'HOME / My Wishlish',
      name: 'HomeMy',
      desc: '',
      args: [],
    );
  }

  /// `SIGN IN`
  String get signIn {
    return Intl.message(
      'SIGN IN',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `HOME/SHOP/CHECKOUT`
  String get homeShopCheckout {
    return Intl.message(
      'HOME/SHOP/CHECKOUT',
      name: 'homeShopCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Your order`
  String get Yourorder {
    return Intl.message(
      'Your order',
      name: 'Yourorder',
      desc: '',
      args: [],
    );
  }

  /// `Receiving Address`
  String get receivingAddress {
    return Intl.message(
      'Receiving Address',
      name: 'receivingAddress',
      desc: '',
      args: [],
    );
  }

  /// `SPECIFICATIONS`
  String get specifications {
    return Intl.message(
      'SPECIFICATIONS',
      name: 'specifications',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a coupon code`
  String get str10 {
    return Intl.message(
      'Please enter a coupon code',
      name: 'str10',
      desc: '',
      args: [],
    );
  }

  /// `PLACE ORDER`
  String get placeOrder {
    return Intl.message(
      'PLACE ORDER',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `SHOPPING CART`
  String get shoppingCart {
    return Intl.message(
      'SHOPPING CART',
      name: 'shoppingCart',
      desc: '',
      args: [],
    );
  }

  /// `HOME/SHOP/SHOPPING CART`
  String get homeShopShoping {
    return Intl.message(
      'HOME/SHOP/SHOPPING CART',
      name: 'homeShopShoping',
      desc: '',
      args: [],
    );
  }

  /// `RECEIVING ADDRESS`
  String get RECEIVINGADDRESS {
    return Intl.message(
      'RECEIVING ADDRESS',
      name: 'RECEIVINGADDRESS',
      desc: '',
      args: [],
    );
  }

  /// `Add address`
  String get addAddress {
    return Intl.message(
      'Add address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `ADD UNIFIED ADDRESS`
  String get addUnifiedAddress {
    return Intl.message(
      'ADD UNIFIED ADDRESS',
      name: 'addUnifiedAddress',
      desc: '',
      args: [],
    );
  }

  /// `Flat rate`
  String get Flatrate {
    return Intl.message(
      'Flat rate',
      name: 'Flatrate',
      desc: '',
      args: [],
    );
  }

  /// `PROCEED`
  String get proceed {
    return Intl.message(
      'PROCEED',
      name: 'proceed',
      desc: '',
      args: [],
    );
  }

  /// `TO CHECKOUT`
  String get tocheckout {
    return Intl.message(
      'TO CHECKOUT',
      name: 'tocheckout',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `ALL GOODS`
  String get allGoods {
    return Intl.message(
      'ALL GOODS',
      name: 'allGoods',
      desc: '',
      args: [],
    );
  }

  /// `HOME/SHOP`
  String get homeShop {
    return Intl.message(
      'HOME/SHOP',
      name: 'homeShop',
      desc: '',
      args: [],
    );
  }

  /// `CONTACT US`
  String get contactUs {
    return Intl.message(
      'CONTACT US',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `ADD CART`
  String get addCart {
    return Intl.message(
      'ADD CART',
      name: 'addCart',
      desc: '',
      args: [],
    );
  }

  /// `DESCRIPTION`
  String get description {
    return Intl.message(
      'DESCRIPTION',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add a review`
  String get addReview {
    return Intl.message(
      'Add a review',
      name: 'addReview',
      desc: '',
      args: [],
    );
  }

  /// `You must be logged in to post a review.`
  String get str11 {
    return Intl.message(
      'You must be logged in to post a review.',
      name: 'str11',
      desc: '',
      args: [],
    );
  }

  /// `LOG IN`
  String get logIn {
    return Intl.message(
      'LOG IN',
      name: 'logIn',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Choose a star`
  String get chooseStar {
    return Intl.message(
      'Choose a star',
      name: 'chooseStar',
      desc: '',
      args: [],
    );
  }

  /// `Release`
  String get release {
    return Intl.message(
      'Release',
      name: 'release',
      desc: '',
      args: [],
    );
  }

  /// `VIEW ALL`
  String get viewAll {
    return Intl.message(
      'VIEW ALL',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `SEACH PRODUCTS`
  String get seachProducts {
    return Intl.message(
      'SEACH PRODUCTS',
      name: 'seachProducts',
      desc: '',
      args: [],
    );
  }

  /// `The more coupons you get, the more `
  String get str12 {
    return Intl.message(
      'The more coupons you get, the more ',
      name: 'str12',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `COPY CODE`
  String get copyCode {
    return Intl.message(
      'COPY CODE',
      name: 'copyCode',
      desc: '',
      args: [],
    );
  }

  /// `TRANSACTIONS`
  String get rechargeRecord {
    return Intl.message(
      'TRANSACTIONS',
      name: 'rechargeRecord',
      desc: '',
      args: [],
    );
  }

  /// `PURCHASE RECORD`
  String get purchaseRecord {
    return Intl.message(
      'PURCHASE RECORD',
      name: 'purchaseRecord',
      desc: '',
      args: [],
    );
  }

  /// `DETAILS`
  String get rechargeMethod {
    return Intl.message(
      'DETAILS',
      name: 'rechargeMethod',
      desc: '',
      args: [],
    );
  }

  /// `DATE/TIME`
  String get RechargeTime {
    return Intl.message(
      'DATE/TIME',
      name: 'RechargeTime',
      desc: '',
      args: [],
    );
  }

  /// `AMOUNT`
  String get RechargeAmount {
    return Intl.message(
      'AMOUNT',
      name: 'RechargeAmount',
      desc: '',
      args: [],
    );
  }

  /// `ORDER NUMBER`
  String get OrderNumber {
    return Intl.message(
      'ORDER NUMBER',
      name: 'OrderNumber',
      desc: '',
      args: [],
    );
  }

  /// `ACTION LIST`
  String get actionList {
    return Intl.message(
      'ACTION LIST',
      name: 'actionList',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message(
      'Unpaid',
      name: 'unpaid',
      desc: '',
      args: [],
    );
  }

  /// `Logistics Details`
  String get logisticsDetails {
    return Intl.message(
      'Logistics Details',
      name: 'logisticsDetails',
      desc: '',
      args: [],
    );
  }

  /// `CONSIGNEE`
  String get consignee {
    return Intl.message(
      'CONSIGNEE',
      name: 'consignee',
      desc: '',
      args: [],
    );
  }

  /// `ORDER TIME`
  String get OrderTime {
    return Intl.message(
      'ORDER TIME',
      name: 'OrderTime',
      desc: '',
      args: [],
    );
  }

  /// `SELECT RECHARGE CURRENCY`
  String get str13 {
    return Intl.message(
      'SELECT RECHARGE CURRENCY',
      name: 'str13',
      desc: '',
      args: [],
    );
  }

  /// `USDT`
  String get USDT {
    return Intl.message(
      'USDT',
      name: 'USDT',
      desc: '',
      args: [],
    );
  }

  /// `PLEASE CONFIRM THE RECHARGE INFORMMATION`
  String get str14 {
    return Intl.message(
      'PLEASE CONFIRM THE RECHARGE INFORMMATION',
      name: 'str14',
      desc: '',
      args: [],
    );
  }

  /// `COLLECTED PRODUCTS`
  String get collectedProducts {
    return Intl.message(
      'COLLECTED PRODUCTS',
      name: 'collectedProducts',
      desc: '',
      args: [],
    );
  }

  /// `Please select`
  String get pleaseSelect {
    return Intl.message(
      'Please select',
      name: 'pleaseSelect',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the QR code content, with a maximum of 100 characters`
  String get str15 {
    return Intl.message(
      'Please enter the QR code content, with a maximum of 100 characters',
      name: 'str15',
      desc: '',
      args: [],
    );
  }

  /// `LOGO`
  String get logo {
    return Intl.message(
      'LOGO',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `color`
  String get color {
    return Intl.message(
      'color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Generate QR code`
  String get generateQrCode {
    return Intl.message(
      'Generate QR code',
      name: 'generateQrCode',
      desc: '',
      args: [],
    );
  }

  /// `Generating`
  String get generating {
    return Intl.message(
      'Generating',
      name: 'generating',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Get access to your Orders,Wishlist and Recommendations.`
  String get str16 {
    return Intl.message(
      'Get access to your Orders,Wishlist and Recommendations.',
      name: 'str16',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password `
  String get str17 {
    return Intl.message(
      'Forgot Password ',
      name: 'str17',
      desc: '',
      args: [],
    );
  }

  /// `Login/Signup`
  String get loginSigup {
    return Intl.message(
      'Login/Signup',
      name: 'loginSigup',
      desc: '',
      args: [],
    );
  }

  /// `MEND`
  String get mend {
    return Intl.message(
      'MEND',
      name: 'mend',
      desc: '',
      args: [],
    );
  }

  /// `CATEGORIES`
  String get categories {
    return Intl.message(
      'CATEGORIES',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `HOME`
  String get home {
    return Intl.message(
      'HOME',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `VOUCHEER CENTER`
  String get voucheer {
    return Intl.message(
      'VOUCHEER CENTER',
      name: 'voucheer',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `cancellation`
  String get cancellation {
    return Intl.message(
      'cancellation',
      name: 'cancellation',
      desc: '',
      args: [],
    );
  }

  /// `Online Service`
  String get onlineService {
    return Intl.message(
      'Online Service',
      name: 'onlineService',
      desc: '',
      args: [],
    );
  }

  /// `SELECT ALL`
  String get selectAll {
    return Intl.message(
      'SELECT ALL',
      name: 'selectAll',
      desc: '',
      args: [],
    );
  }

  /// `DESELECT ALL`
  String get deselectAll {
    return Intl.message(
      'DESELECT ALL',
      name: 'deselectAll',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Search for products, categories, brands, sku...`
  String get str18 {
    return Intl.message(
      'Search for products, categories, brands, sku...',
      name: 'str18',
      desc: '',
      args: [],
    );
  }

  /// `Blog`
  String get blog {
    return Intl.message(
      'Blog',
      name: 'blog',
      desc: '',
      args: [],
    );
  }

  /// `Voucher center`
  String get voucherCenter {
    return Intl.message(
      'Voucher center',
      name: 'voucherCenter',
      desc: '',
      args: [],
    );
  }

  /// `Attentions`
  String get attentions {
    return Intl.message(
      'Attentions',
      name: 'attentions',
      desc: '',
      args: [],
    );
  }

  /// `My Wishlish`
  String get myWishlish {
    return Intl.message(
      'My Wishlish',
      name: 'myWishlish',
      desc: '',
      args: [],
    );
  }

  /// `NEWSLETTER`
  String get newSletter {
    return Intl.message(
      'NEWSLETTER',
      name: 'newSletter',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe to our mailing list to get the newupdates!`
  String get str19 {
    return Intl.message(
      'Subscribe to our mailing list to get the newupdates!',
      name: 'str19',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get plsEmail {
    return Intl.message(
      'Please enter your email',
      name: 'plsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter email verification code`
  String get plsEmailCode {
    return Intl.message(
      'Enter email verification code',
      name: 'plsEmailCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPwd {
    return Intl.message(
      'Enter Password',
      name: 'enterPwd',
      desc: '',
      args: [],
    );
  }

  /// `Enter the password again`
  String get entertPwsAgain {
    return Intl.message(
      'Enter the password again',
      name: 'entertPwsAgain',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the captcha`
  String get plsCapcha {
    return Intl.message(
      'Please enter the captcha',
      name: 'plsCapcha',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
