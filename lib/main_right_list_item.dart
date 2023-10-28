import 'package:flutter/material.dart';

class MainRightListItem extends StatelessWidget {
  final String itemName;
  final Function onTapClick;

  MainRightListItem({required this.itemName, required this.onTapClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapClick();
        },
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(itemName),
          Icon(
            Icons.arrow_forward,
            size: 24.0,
          )
        ]));
  }
}
