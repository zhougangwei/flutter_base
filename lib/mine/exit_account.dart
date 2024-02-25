import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Point'),
      content: Text('Are you sure you want to exit account?'),
      actions: [
        TextButton(
          onPressed: () {
            // 取消退出登陆
            Navigator.of(context).pop(false);
          },
          child:  Text('Cancel',style: TextStyle(color: Theme.of(context).primaryColor),),
        ),
        TextButton(
          onPressed: () {
            // 确认退出登陆
            Navigator.of(context).pop(true);
          },
          child: Text('Confirm',style: TextStyle(color: Theme.of(context).primaryColor),),
        ),
      ],
    );
  }
}
