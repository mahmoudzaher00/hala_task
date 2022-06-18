import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hala_task/app/app_colors.dart';
import 'package:hala_task/app/assets_manager.dart';



enum ToastStates {
  success,
  error,
  warning,
}

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.success:
      color = AppColors.greenColor;
      break;
    case ToastStates.error:
      color = AppColors.redColor;
      break;
    case ToastStates.warning:
      color = Colors.amber;
      break;
  }

  return color;
}

void showToast({required String message, required ToastStates state}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: chooseToastColor(state),
    textColor: AppColors.white,
    fontSize: 16.0,
  );
}



