import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

bool isType<T, Y>() => T == Y;

void displayToastMessage(String text, {Toast toastLength = Toast.LENGTH_LONG}) {
  Fluttertoast.showToast(
    msg: text,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.black87,
    textColor: Colors.white,
    webShowClose: true,
    toastLength: toastLength,
  );
}

String getImageExtension(File imageFile) {
  String filePath = imageFile.path;
  String extension = filePath.substring(filePath.lastIndexOf('.'));
  return extension; // e.g., '.jpg', '.png'
}

void showSnackBar(
  BuildContext context,
  String message, {
  SnackBarAction? action,
}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(message), action: action));
}
