import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final String? fontFamily;
  final Color? textColor;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  const CustomText({super.key, this.text, this.textColor, this.fontSize, this.fontWeight, this.textAlign, this.textDecoration, this.fontFamily, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(text!,style: TextStyle(
      color: textColor,
      fontWeight: fontWeight??FontWeight.w700,
      fontSize:fontSize,
      fontFamily: fontFamily??'OpenSans',
      decoration: textDecoration,
    ),textAlign:textAlign?? TextAlign.center,maxLines: maxLines);
  }
}
