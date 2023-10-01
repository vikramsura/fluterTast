
import 'package:flutter/material.dart';

class AppButton {
  static Container appButton(
      BuildContext context, title, btnColor, styleColor, width,height,fontSizes) {
    return Container(
      child: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: fontSizes, color: styleColor,fontWeight: FontWeight.w800),
      )),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
