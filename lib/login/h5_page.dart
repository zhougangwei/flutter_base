import 'package:flutter/material.dart';  
import 'package:webview_flutter/webview_flutter.dart';  
  
class H5Page extends StatelessWidget {  
  final String url;  
  final String title;

  H5Page({required this.title,required this.url});
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title),
      ),  
      body: WebView(  
        initialUrl: url,  
        javascriptMode: JavascriptMode.unrestricted, // 根据需要设置JavaScript模式  
      ),  
    );  
  }  
}