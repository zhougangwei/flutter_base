import 'package:atest/shop/bean/good_cat_bean_entity.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Carousel extends StatefulWidget {
  List<String> bannerList = [];

  Carousel(this.bannerList);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    this.imageUrls = widget.bannerList;
  }

  void setImagerUrls(imageUrls) {
    setState(() {
      this.imageUrls = imageUrls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          print(realIndex.toString() + "---" + index.toString());
          if (imageUrls.isEmpty) {
            return Container();
          }
          return Image.network(imageUrls[index]);
        },
        options: CarouselOptions(
          height: 200,
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
        ),
      ),
    );
  }
}
