import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hala_task/app/app_colors.dart';
import 'package:hala_task/app/assets_manager.dart';
import 'package:hala_task/app/functions.dart';



void navigateAndFinish(context , widget) {
  Navigator.pushAndRemoveUntil
    (context, MaterialPageRoute(builder: (context)=> widget), (Route<dynamic> route) => false,);
}

void showToast({required String message, required ToastStates state}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: AppColors.greyBorder,
    textColor: AppColors.textColor,
    fontSize: 16.0,
  );
}

