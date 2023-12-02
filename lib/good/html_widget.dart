import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlWidget extends StatefulWidget {
  const HtmlWidget({super.key});

  @override
  HtmlWidgetState createState() => HtmlWidgetState();
}


class HtmlWidgetState extends State<HtmlWidget> {
  bool _isVisible = false;
  String? html = "";

  void showWidget(bool _isExpanded,String? html) {
    setState(() {
      this.html = html;
      _isVisible = _isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isVisible ? Html(data: html) : Container(),
    );
  }
}
