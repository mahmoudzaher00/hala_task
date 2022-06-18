import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color? color;
  final Alignment? alignment;
  final int? maxLine;
  final double? height;
  final double? width;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  const CustomText({Key? key,
    this.text = '',
    this.fontSize = 14,
    this.color = Colors.black,
    this.alignment ,
    this.maxLine,
    this.height = 1,
    this.width,
    this.fontWeight = FontWeight.bold,
    this.textOverflow,
    this.textAlign,
    this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: alignment,
        width: width,
        child: Text(
          text!,
          textAlign: textAlign,
          style: TextStyle(
              color: color,
              height: height,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: textOverflow,
              decoration: decoration,
              fontFamily: 'din-next-lt-w23-regular.ttf'
            ),

          maxLines: maxLine,
        )
    );
  }
}
