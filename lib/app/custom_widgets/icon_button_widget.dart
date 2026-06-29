import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:flutter/material.dart';

Widget iconButtonWidget({
  required IconData icon,
  required VoidCallback onTap,
  double? b_width,
  double? b_hight,
  double? icon_size,
  Color? backgroundColor,
  Color? iconColor,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: onTap,
    child: Container(
      width: b_width ?? 35,
      height: b_hight ?? 35,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.iconButtonbackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white, size: icon_size ?? 25),
    ),
  );
}
