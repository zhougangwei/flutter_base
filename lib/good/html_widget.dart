import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/common_utils.dart';
import 'html_loader.dart';


class HtmlWidget extends StatefulWidget {
  const HtmlWidget({super.key});

  @override
  HtmlWidgetState createState() => HtmlWidgetState();
}


class HtmlWidgetState extends State<HtmlWidget> {
  bool _isVisible = false;
  String html = "";

  void showWidget(bool _isExpanded,String? html) {
    if(html!=null){
      setState(() {
        this.html = html;
        _isVisible = _isExpanded;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return
      _isVisible?
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [GestureDetector(child: Container(
          padding: EdgeInsets.all(8),
          color: Theme.of(context).primaryColor,
          child: Text('click to copy All',style:TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold))),onTap: (){
        gotoClip(html);
      },), HtmlLoader(content: html)],
    ): Container();


  }


  void gotoClip(content) {
    if(content!=null){
      Clipboard.setData(ClipboardData(text: extractPlainTextFromHtml(content)));
      successToShow('Copy succeeded');
    }
  }

  String extractPlainTextFromHtml(String html) {
    // 使用正则表达式匹配并替换所有的HTML标签
    String plainText = html.replaceAllMapped(
      RegExp(r'<[^>]+>'), // 匹配所有HTML标签
          (Match match) => '', // 将匹配到的标签替换为空字符串
    );
    return plainText;
  }

}
