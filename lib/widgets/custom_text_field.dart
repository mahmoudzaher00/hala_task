
import 'package:flutter/material.dart';

import '../../app/app_colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? hint;
  double? width;
  double? height;
  late bool obscure;
  String? label;
  TextStyle? hintStyle;
  String? headLine;
  IconData? icon;
  Widget? prefixIconWidget;
  Widget? iconWidget;
  Color? labelColor;
  TextInputType? textType;
  Function(String val)? onChange;
  Function()? iconPressed;
  Function()? onPressed;
  bool? enabled;
  FocusNode? focusNode;
  int? maxLines;
  int? minLines;
  int? maxLength;

  CustomTextField(
      {this.controller,
        this.hint = "",
        this.width,
        this.prefixIconWidget,
        this.height,
        this.obscure = false,
        this.label,
        this.hintStyle,
        this.icon,
        this.iconWidget,
        this.enabled = true,
        this.labelColor,
        this.textType,
        this.onPressed,
        this.focusNode,
        this.maxLines,
        this.minLines,
        this.headLine,
        this.iconPressed,
        this.maxLength,
        this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: width ?? double.infinity,
        height: 80,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  headLine ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.black,
                    fontFamily: "DIN-DEMI",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: height ?? 48,
              decoration: BoxDecoration(
                color: AppColors.mainColorGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                minLines: minLines ?? 1,
                maxLines: maxLines ?? 1,
                // maxLength: maxLength,
                enabled: enabled,
                keyboardType: textType ?? TextInputType.text,
                controller: controller,
                focusNode: focusNode,
                onChanged: onChange,
                obscureText: obscure,
                style:  const TextStyle(color: Colors.black),
                decoration: InputDecoration(


                    hintText: hint ?? "",
                    hintStyle: hintStyle ??
                        const TextStyle(
                          fontSize: 12,
                          color: AppColors.hintTextColor,
                        ),
                    // labelText: label,
                    // labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                    contentPadding:
                    const EdgeInsets.only(top: 8, right: 8, left: 8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: AppColors.primaryColorBrown),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: AppColors.primaryColorBrown),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                      const BorderSide(color: AppColors.primaryColorBrown),
                    ),
                    prefixIcon: prefixIconWidget ?? null,
                    suffixIcon: iconWidget == null
                        ? (icon == null
                        ? null
                        : InkWell(
                        onTap: iconPressed ?? () {},
                        child: Icon(
                          icon,
                          size: 18,
                          color: AppColors.primaryColorBrown,
                        )))
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        iconWidget!,
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}