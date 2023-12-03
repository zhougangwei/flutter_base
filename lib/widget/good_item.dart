import 'package:atest/widget/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodItem extends StatelessWidget {
  final String image_url;
  final String cat_name;
  final String name;
  final String scoreSum;
  final String price;
  final String mktprice;

  const GoodItem(
      {super.key,
      required this.image_url,
      required this.cat_name,
      required this.name,
      required this.scoreSum,
      required this.price,
      required this.mktprice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(imageUrl: image_url,width: 295.w,),
            if(cat_name.isNotEmpty)
              Text(
                cat_name,
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
                name,
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
                Text('(${scoreSum ?? ''})', style: TextStyle(fontSize: 20.sp)),
              ],
            ),
            SizedBox(height: 15.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '\$${price}-\$${mktprice}',
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
      ),
    );
  }
}
