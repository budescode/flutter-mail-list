
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';



void showToast({
  required BuildContext context,
  required String msg,
}) {
  // Create an instance of ToastContext
  final toastContext = ToastContext();
  
  // Initialize the ToastContext with the current BuildContext
  toastContext.init(context);

  // Show the toast message
  return Toast.show(msg, duration: Toast.lengthShort, gravity: Toast.bottom);
}