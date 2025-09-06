import 'package:flutter/material.dart';

import '../core/app_export.dart';

class CustomCategoriesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomCategoriesAppBar({
    Key? key,
    this.title,
    this.switchLabel,
    this.switchValue,
    this.onSwitchChanged,
    this.onTitleTap,
  }) : super(key: key);

  final String? title;
  final String? switchLabel;
  final bool? switchValue;
  final Function(bool)? onSwitchChanged;
  final VoidCallback? onTitleTap;

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    final bool isGuest = switchLabel == null || onSwitchChanged == null;

    return AppBar(
      backgroundColor:
        isGuest ? appTheme.indigo_900 : appTheme.light_blue_200,
      elevation: 3,
      shadowColor: appTheme.color746074,
      automaticallyImplyLeading: false,
      toolbarHeight: 70.h,
      titleSpacing: 20.h,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null)
            InkWell(
              onTap: onTitleTap,
              child: Text(
                title ?? '',
                style: TextStyleHelper.instance.title20RegularInter
                    .copyWith(height: 1.25),
              ),
            ),

          const Spacer(),

          if (!isGuest) ...[
            Text(
              switchLabel ?? '',
              style: TextStyleHelper.instance.label10RegularInter
                  .copyWith(height: 1.3),
            ),
            SizedBox(width: 4.h),
            Switch(
              value: switchValue ?? false,
              onChanged: onSwitchChanged,
              activeThumbColor: appTheme.colorFF52D1,
              inactiveThumbColor: appTheme.greyCustom,
            ),
          ],
        ],
      ),
    );
  }
}