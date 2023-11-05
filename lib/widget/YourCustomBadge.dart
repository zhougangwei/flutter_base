import 'package:flutter/material.dart';

class YourCustomBadge extends StatelessWidget {
  final String content;
  final Color bgColor;
  final bool isDot;
  final Offset offset;

  const YourCustomBadge({
    Key? key,
    this.content = '',
    this.bgColor = Colors.red,
    this.isDot = false,
    this.offset = const Offset(-6, -6),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 如果是点标记，我们不显示文本内容。
    Widget badgeContent = isDot
        ? SizedBox() // Dot badge doesn't need content
        : Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          );

    return Positioned(
      right: offset.dx,
      top: offset.dy,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
          minWidth: isDot ? 10 : 16,
          minHeight: isDot ? 10 : 16,
        ),
        child: Center(
          child: badgeContent,
        ),
      ),
    );
  }
}
