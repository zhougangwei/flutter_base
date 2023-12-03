import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithDivider extends StatelessWidget {
  final String text;

  TextWithDivider({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(children: [
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 0.h,
          child: Container(
            width: double.infinity,
            child: Divider(
              color: Color(0x33333333),
              thickness: 2.h,
            ),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0.h,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 0.h,
              child: Divider(
                color: Theme.of(context).primaryColor,
                thickness: 3.h,
              ),
            ),
          ],
        )
      ]),
    );
  }
}