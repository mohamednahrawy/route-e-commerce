import 'package:flutter/material.dart';

class DialogUtils {
  static showLoading(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            content: Row(children: [
              CircularProgressIndicator(),
            ]),
          );
        });
  }

  static hideLoading(context) {
    Navigator.of(context).pop();
  }

  static Future showMessage(context, String message,
      {String? title,
        String? positiveActionName,
        String? negativeActionName,
        VoidCallback? positiveAction,
        VoidCallback? negativeAction}) async {
    List<Widget> actions = [];
    if (positiveActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            positiveAction?.call();
          },
          child: Text(positiveActionName)));
    }
    if (negativeActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            negativeAction?.call();
          },
          child: Text(negativeActionName)));
    }
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(message),
            title: Text(title ?? ''),
            actions: actions,
          );
        });
  }
}