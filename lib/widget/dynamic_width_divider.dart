import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithDivider extends StatelessWidget {
  final String text;

  TextWithDivider({required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 28.sp),
            ),
            SizedBox(
              height: 15.0.h,
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 1.0,
          child: Divider(
            color: Theme.of(context).primaryColor,
            thickness: 2.h,
          ),
        ),
      ],
    );
  }
}