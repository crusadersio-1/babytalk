import 'package:flutter/material.dart';
import '../core/app_export.dart';

class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  TextStyle get headline30BoldNunito => TextStyle(
        fontSize: 30.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: appTheme.indigo_400,
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20RegularInter => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get title16RegularNunito => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: appTheme.gray_600,
      );

  TextStyle get body14RegularNunito => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: appTheme.black_900,
      );

  TextStyle get body12BoldNunito => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: appTheme.indigo_400,
      );

  TextStyle get body12RegularNunito => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Nunito',
        color: appTheme.indigo_400,
      );

  TextStyle get label10BoldNunito => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito',
        color: appTheme.indigo_400,
      );

  TextStyle get label10RegularInter => TextStyle(
        fontSize: 10.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.black_900,
      );

  TextStyle get bodyTextNunito => TextStyle(
        fontFamily: 'Nunito',
      );
}
