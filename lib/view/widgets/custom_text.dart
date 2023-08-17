import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text; 
  double? fontSize;
  FontWeight? fontweight;
  Color? color;
  TextOverflow? overflow;
  int? maxLines;
  CustomText({super.key, this.text, this.color, this.fontSize, this.fontweight, this.overflow, this.maxLines} );

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontweight,
        color: color,
        overflow: overflow
      ),
    );
  }
}