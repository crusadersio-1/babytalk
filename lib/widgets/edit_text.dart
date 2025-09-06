import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './image_view.dart';

class CustomEditText extends StatefulWidget {
  CustomEditText({
    Key? key,
    this.controller,
    this.placeholder,
    this.leftIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.margin,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? placeholder;
  final String? leftIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final EdgeInsets? margin;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isObscured,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        style: TextStyleHelper.instance.title16RegularNunito,
        decoration: InputDecoration(
          hintText: widget.placeholder ?? '',
          hintStyle: TextStyleHelper.instance.title16RegularNunito,
          filled: true,
          fillColor: appTheme.white_A700,
          contentPadding: EdgeInsets.only(
            top: 16.h,
            right: 14.h,
            bottom: 16.h,
            left: widget.leftIcon != null ? 38.h : 14.h,
          ),
          prefixIcon: widget.leftIcon != null
              ? Container(
                  padding: EdgeInsets.all(12.h),
                  child: CustomImageView(
                    imagePath: widget.leftIcon!,
                    height: 22.h,
                    width: 22.h,
                    fit: BoxFit.contain,
                  ),
                )
              : null,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                    color: appTheme.gray_600,
                    size: 20.h,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: appTheme.gray_500,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: appTheme.gray_500,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: appTheme.gray_500,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: appTheme.redCustom,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.h),
            borderSide: BorderSide(
              color: appTheme.redCustom,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
