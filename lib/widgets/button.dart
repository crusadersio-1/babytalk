import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.borderRadius,
    this.padding,
    this.margin,
    this.width,
    this.height,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 46.h,
      margin: margin ?? EdgeInsets.only(top: 56.h),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFFfdb646),
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 8.h,
                horizontal: 30.h,
              ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 6.h),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: TextStyleHelper.instance.bodyTextNunito
              .copyWith(color: textColor ?? Color(0xFFffffff), height: 1.4),
        ),
      ),
    );
  }
}
