import 'package:flutter/material.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

class ThemeHelper {
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  LightCodeColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  Color get black_900 => Color(0xFF000000);
  Color get light_blue_A700 => Color(0xFF008AFF);
  Color get blue_100 => Color(0xFFCCEBFF);
  Color get gray_300 => Color(0xFFE3E4E8);
  Color get light_blue_200 => Color(0xFF81C9FD);
  Color get gray_600_60 => Color(0x60747474);
  Color get light_blue_100 => Color(0xFFC0ECFF);
  Color get gray_700_75 => Color(0x755E5E5E);
  Color get indigo_400 => Color(0xFF447FB1);
  Color get gray_600 => Color(0xFF707070);
  Color get gray_500 => Color(0xFF979797);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get orange_300 => Color(0xFFFDB646);
  Color get cyan_100 => Color(0xFFA2E9F7);
  Color get indigo_900 => Color(0xFF381E72);

  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get greyCustom => Colors.grey;
  Color get redCustom => Colors.red;
  Color get color5E755E => Color(0x5E755E5E);
  Color get color746074 => Color(0x74607474);
  Color get colorFF52D1 => Color(0xFF52D1C6);

  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
