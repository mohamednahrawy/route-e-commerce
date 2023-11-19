import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class DialogUtils {
  static showLoading(context, {String? message}) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).primaryColor,
            content: Row(children: [
              CircularProgressIndicator(color: AppColors.whiteColor),
              SizedBox(
                width: 20.w,
              ),
              Text(message ?? '')
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
            backgroundColor: Theme.of(context).primaryColor,
            content: Text(message),
            title: Text(title ?? ''),
            actions: actions,
          );
        });
  }
}
