import 'package:flutter/material.dart';
import 'package:hala_task/app/app_colors.dart';

class BuildTextFieldView extends StatelessWidget {
  BuildTextFieldView({
    this.controller,
    this.hintText,
    this.fillColorTextFiled,
    this.filledColorTextFiled,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.textType,
    this.focusNode,
    this.onChangedFunction,
    this.validatorFunction,
    this.onEditingCompleteFunction,
    this.textInputAction,
    this.obscure
  });

  final TextEditingController? controller;
  final Color? fillColorTextFiled;
  final bool? filledColorTextFiled;
  final TextInputType? textType;
  final String? hintText;
  final ValueChanged<String>? onChangedFunction;
  final FormFieldValidator<String>? validatorFunction;
  final VoidCallback? onEditingCompleteFunction;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final bool? obscure;



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: controller,
        enableSuggestions: true,

        keyboardType: textType ?? TextInputType.text,
        decoration:  InputDecoration(
          hintText: hintText??'',
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color:AppColors.mainColorIndigo, width: .5),
            borderRadius: BorderRadius.circular(4),
          ),
          fillColor: fillColorTextFiled??Colors.white,
          filled: filledColorTextFiled??true,
          prefixIcon: prefixIconWidget,
          suffixIcon: suffixIconWidget,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.mainColorIndigo, width: 1)),
          errorBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: AppColors.mainColorIndigo, width: 1),
              borderRadius: BorderRadius.circular(4)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.mainColorIndigo, width: 2)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        ),
        onChanged: onChangedFunction,
        focusNode: focusNode,
        onEditingComplete: onEditingCompleteFunction,
        validator:validatorFunction,
        textInputAction: textInputAction,
         obscureText: obscure??false,

      ),
    );
  }
}