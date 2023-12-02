import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/l10n.dart';


typedef MyCallback = void Function(String word);

class RoundedSearchBar extends StatelessWidget {


  final MyCallback onKeyword;

  final TextEditingController searchController = TextEditingController();

   RoundedSearchBar({super.key, required this.onKeyword});

  @override
  Widget build(BuildContext context) {
    final localizations = S.of(context);

    return Container(
      color: Color(0xff072D8C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70.h,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.white, // 设置剪切区域的背景颜色
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 24.sp),
                          controller: searchController,
                          decoration: InputDecoration(
                            isCollapsed: true,
                            hintText: localizations.str18,
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          onSubmitted: (value) {
                            onKeyword(value);
                            // 在此处处理提交搜索的逻辑
                            // 可以调用适当的函数或回调来处理搜索结果
                          },
                        ),
                      ),
                      Image.asset('assets/images/image/icon-4.png',width: 30.w,),
                      SizedBox(width: 20.w)
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 36.h,
          )
        ],
      ),
    );
  }
}
