import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static errorDialogBox(BuildContext context, String title, String content) =>
      showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      );
}
