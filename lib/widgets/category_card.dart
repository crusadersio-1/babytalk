import 'package:flutter/material.dart';

import '../core/app_export.dart';
import 'image_view.dart';
import '../pages/home.dart';

class CategoryCardWidget extends StatelessWidget {
  CategoryModel category;
  VoidCallback? onTap;

  CategoryCardWidget({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.light_blue_100,
          border: Border.all(
            color: appTheme.black_900,
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(10.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.color5E755E,
              offset: Offset(0, 4.h),
              blurRadius: 4.h,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: CustomImageView(
                  imagePath: category.image ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                category.title ?? '',
                style: TextStyleHelper.instance.title20RegularInter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
