// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:atest/shop/bean/banner_bean_entity.dart';
import 'package:atest/shop/bean/good_cat_bean_entity.dart';
import 'package:atest/shop/bean/type_item_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {

    if (<BannerBeanEntity>[] is M) {
      return data.map<BannerBeanEntity>((Map<String, dynamic> e) =>
          BannerBeanEntity.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanEntity>[] is M) {
      return data.map<GoodCatBeanEntity>((Map<String, dynamic> e) =>
          GoodCatBeanEntity.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanChild>[] is M) {
      return data.map<GoodCatBeanChild>((Map<String, dynamic> e) =>
          GoodCatBeanChild.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanGoods>[] is M) {
      return data.map<GoodCatBeanGoods>((Map<String, dynamic> e) =>
          GoodCatBeanGoods.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanGoodsProduct>[] is M) {
      return data.map<GoodCatBeanGoodsProduct>((Map<String, dynamic> e) =>
          GoodCatBeanGoodsProduct.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanGoodsCanshu>[] is M) {
      return data.map<GoodCatBeanGoodsCanshu>((Map<String, dynamic> e) =>
          GoodCatBeanGoodsCanshu.fromJson(e)).toList() as M;
    }
    if (<GoodCatBeanGoodsBrand>[] is M) {
      return data.map<GoodCatBeanGoodsBrand>((Map<String, dynamic> e) =>
          GoodCatBeanGoodsBrand.fromJson(e)).toList() as M;
    }
    if (<TypeItemEntity>[] is M) {
      return data.map<TypeItemEntity>((Map<String, dynamic> e) =>
          TypeItemEntity.fromJson(e)).toList() as M;
    }

    debugPrint("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (BannerBeanEntity).toString(): BannerBeanEntity.fromJson,
    (GoodCatBeanEntity).toString(): GoodCatBeanEntity.fromJson,
    (GoodCatBeanChild).toString(): GoodCatBeanChild.fromJson,
    (GoodCatBeanGoods).toString(): GoodCatBeanGoods.fromJson,
    (GoodCatBeanGoodsProduct).toString(): GoodCatBeanGoodsProduct.fromJson,
    (GoodCatBeanGoodsCanshu).toString(): GoodCatBeanGoodsCanshu.fromJson,
    (GoodCatBeanGoodsBrand).toString(): GoodCatBeanGoodsBrand.fromJson,
    (TypeItemEntity).toString(): TypeItemEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}