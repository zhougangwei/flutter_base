import 'package:abce/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../network/user.dart';
import '../utils/common_utils.dart';

class GoodItem extends StatefulWidget {
  final int id;
  final String image_url;
  final String cat_name;
  final String name;
  final String scoreSum;
  final String price;
  final String mktprice;
  final bool isfav;
  final Function? callback;

  const GoodItem({super.key, required this.image_url, required this.cat_name, required this.name, required this.scoreSum, required this.price, required this.mktprice, required this.isfav, required this.callback, required this.id});
  @override
  State<StatefulWidget> createState() {
    return GoodItemState();
  }
}

class GoodItemState extends State<GoodItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.image_url,
                  width: 295.w,
                  height: 320.h,
                  placeholder: (context, url) =>
                      Icon(
                        Icons.downloading,
                        size: 141.w,
                        color: Color(0x22333333),
                      ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.downloading,
                    size: 141.w,
                    color: Color(0x22333333),
                  ),
                ),
                if (widget.cat_name.isNotEmpty)
                  Text(
                    widget.cat_name,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 20.sp,
                    ),
                  ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    RatingWidget(size: 30.w, initialRating: 5),
                    Text('(${widget.scoreSum ?? ''})',
                        style: TextStyle(fontSize: 20.sp)),
                  ],
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$${widget.price}-\$${widget.mktprice}',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff333333),
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 5.w,
                top: 5.w,
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Builder(builder: (context) {
                    if (widget.isfav) {
                      return GestureDetector(
                        onTap: () {
                          collection(widget.id);
                        },
                        child: Image.asset('assets/images/image/icon-6.png',
                            width: 40.w),
                      );
                    }
                    return Image.asset('assets/images/image/icon-17.png',
                        width: 40.w);
                  }),
                )),
          ],
        ),
      ),
    );
  }

  void collection(int id) {
    Map<String, dynamic> data = {
      'goods_id': id,
    };
    ApiClient().goodscollection(data).then((res) {
      if (res['status']) {
        successToShow(res['msg']);
       widget.callback?.call();
      }
    }).catchError((err) {
      if (err.status == false && err.data == 14006) {
        setState(() {
        });
      }
    });
  }
}
