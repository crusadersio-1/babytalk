import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomSwitch extends StatelessWidget {
  CustomSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.margin,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  final bool value;
  final Function(bool)? onChanged;
  final EdgeInsets? margin;
  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: 4.h, left: 4.h),
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: activeColor ?? Theme.of(context).primaryColor,
        inactiveThumbColor: inactiveColor ?? appTheme.greyCustom,
        inactiveTrackColor:
            inactiveColor?.withAlpha(77) ?? appTheme.greyCustom.withAlpha(77),
      ),
    );
  }
}
