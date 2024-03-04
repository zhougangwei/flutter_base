// 保存到相册的UTil
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveToAlbumUtil {


  static void saveNetworkImage(String imageUrl) async {
    var response = await Dio().get(
        imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    Fluttertoast.showToast(
      msg: 'success',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(0xff072D8C),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
