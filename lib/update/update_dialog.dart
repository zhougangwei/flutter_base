import 'package:flutter/material.dart';

class UpdateDialog extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;

  UpdateDialog({required this.message, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('UPDATE'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
            child: Text('Update now'),
            onPressed: () {
              onConfirm();
            }),
        TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
      contentPadding: EdgeInsets.all(20.0),
    );
  }
}
