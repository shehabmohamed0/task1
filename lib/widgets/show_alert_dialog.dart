import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
  void Function()? onCancelAction,
  required void Function() onDefaultAction,
}) {
  if (!Platform.isIOS) {
    return showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                if (cancelActionText != null)
                  TextButton(
                    child: Text(cancelActionText),
                    onPressed: () => onCancelAction == null
                        ? Navigator.of(context).pop()
                        : onCancelAction,
                  ),
                TextButton(
                  child: Text(defaultActionText),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onDefaultAction();
                  },
                )
              ],
            ));
  }
  return showDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              if (cancelActionText != null)
                TextButton(
                  child: Text(cancelActionText),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              TextButton(
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              )
            ],
          ));
}
