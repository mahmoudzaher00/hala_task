import 'package:flutter/material.dart';
import 'package:hala_task/app/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width-26,
        height: 50,
        child: const SizedBox(
            height: 40,
            width:50,
            child: CircularProgressIndicator()));
  }
}