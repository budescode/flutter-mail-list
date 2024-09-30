import 'package:flutter/material.dart';

Widget textWidget(String data,
    {Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    TextAlign? textAlign}) {
  
  return Text(
    data,
    textAlign: textAlign,
    style: TextStyle(
        fontSize: fontSize ,
        fontWeight: fontWeight ,
        color: color),
  );
}
