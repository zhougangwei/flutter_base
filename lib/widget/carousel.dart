import 'dart:io';

import 'package:abce/shop/bean/good_cat_bean_entity.dart';
import 'package:abce/widget/SaveToAlbumUtil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class Carousel extends StatefulWidget {
  List<String> bannerList = [];

  Carousel(this.bannerList);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  var _tapPosition;
  List<String> imageUrls = [];



  @override
  void initState() {
    _tapPosition = Offset(0.0, 0.0);
    super.initState();
    this.imageUrls = widget.bannerList;
  }

  void setImagerUrls(imageUrls) {
    setState(() {
      this.imageUrls = imageUrls;
    });
  }



  void _showCustomMenu(url ) {
    RenderBox overlay = Overlay.of(context)?.context?.findRenderObject() as RenderBox;

    showMenu(
      context: context,
      items: <PopupMenuEntry<int>>[
        const PopupMenuItem<int>(
          value: 1,
          child: Text('Download'),
        ),
      ],
      position: RelativeRect.fromRect(
          _tapPosition & Size.zero, // smaller rect, the touch area
          Offset.zero & overlay.size // Bigger rect, the entire screen
      ),
    ).then((value) {
      if (value == null) {
        print('cancel');
        return;
      }

      if (value == 1) _download(url);
    });
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  void _download(url) async {
    /// 自动选择文件夹
    /// /Android/data/com.<appn
    ///
    // 1. 获取权限
    var storageStatus = await Permission.storage.status;

    // 没有权限则申请
    if(storageStatus != PermissionStatus.granted) {
      storageStatus = await Permission.storage.request();
      if(storageStatus != PermissionStatus.granted) {
        return;
      }
    }

    SaveToAlbumUtil.saveNetworkImage(url);
  }




  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          print(realIndex.toString() + "---" + index.toString());
          if (imageUrls.isEmpty) {
            return Container();
          }
          return GestureDetector(
              onTapDown: _storePosition,
            onLongPress: (){
              _showCustomMenu(imageUrls[index]);
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              child: CachedNetworkImage(
                  imageUrl:imageUrls[index],
                  fit: BoxFit.cover),
            ),
          );
        },
        options: CarouselOptions(
          clipBehavior:Clip.none,
          viewportFraction:1,
          autoPlay: true,
          enlargeCenterPage: false,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }


}
