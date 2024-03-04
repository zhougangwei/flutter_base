import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 引入库文件
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/common_utils.dart';

class HtmlLoader extends StatefulWidget {

  final String content;

  const HtmlLoader({ required this.content});
  @override
  State<HtmlLoader> createState() => HtmlLoaderState();
}

class HtmlLoaderState extends State<HtmlLoader> {
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {

    // LongPressGestureRecognizer rec=LongPressGestureRecognizer();
    // rec.onLongPress=(){
    //   gotoClip(widget.content);
    // };
    Set<Factory<OneSequenceGestureRecognizer>> set={
      Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
     // Factory<LongPressGestureRecognizer>(() => rec),
    };
    return  Container(
      width: double.infinity,
      height: 300.h,
      child: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController controller) {
            this.controller = controller;
            _loadHtmlFromAssets();
          },
        gestureRecognizers: set,
        ),
    );

  }
  // 加载显示html文件；
                                                                                                                                                                                                    _loadHtmlFromAssets() async {

    String htmlStr = """<!DOCTYPE html>
    <html>
      <head><meta name="viewport" content="width=device-width, initial-scale=0.8"></head>
      <body style='"margin: 0; padding: 0;'>
        <div>
          ${widget.content}
        </div>
      </body>
    </html>""";


    String fileHtmlContents = htmlStr;
    print(fileHtmlContents);
    controller.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }


}
