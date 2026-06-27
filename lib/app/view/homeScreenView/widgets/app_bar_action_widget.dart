import 'package:flutter/material.dart';

Widget appbarActionButton({
  required IconData icon,
  required VoidCallback onTap,

  Color backgroundColor = const Color(0xFFF4F5F7),
  Color iconColor = Colors.black87,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(18),
    onTap: onTap,
    child: Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Icon(icon, color: iconColor, size: 26),
    ),
  );
}
