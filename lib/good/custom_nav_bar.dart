import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Assume you have these custom widgets or find equivalents in Flutter
import '../widget/YourCustomBadge.dart';

class YourCustomNavBar extends StatelessWidget {
  // Define your configuration and data here
  final String title = "";
  final Color titleColor = Colors.black; // or a color from your config
  final Color navigationBarBackgroundColor =
      Colors.white; // or a color from your config
  final bool showList = false; // Example state variable
  // ... other state variables like langValue, langList, etc.

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      backgroundColor: navigationBarBackgroundColor,
      elevation: 0,
      // Removes the shadow under the AppBar
      leading: Padding(
        padding: EdgeInsets.only(left: 25.0),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/icon-logo.png",
            ),
          ],
        ),
      ),
      actions: <Widget>[
        // You need to handle your routing logic accordingly
        GestureDetector(
          onTap: () {
            // Logic for language/currency selector
          },
        ),
        GestureDetector(
          onTap: () {
            // Logic for user profile routing
          },
          child: Image.asset(
            "assets/images/icon-1.png",
          ),
        ),
        GestureDetector(
          onTap: () {
            // Logic for wishlist routing
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Image.asset(
                "assets/images/icon-3.png",
              ),
              YourCustomBadge(
                isDot: true,
                offset: Offset(-6, -6),
                bgColor: Color(0xFFFFD504),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            // Logic for cart routing
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Image.asset("assets/images/icon-2.png"),
              YourCustomBadge(
                isDot: true,
                offset: Offset(-6, -6),
                bgColor: Color(0xFFFFD504),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
