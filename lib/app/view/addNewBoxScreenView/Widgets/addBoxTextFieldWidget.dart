import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget addBoxTextFieldWidget({
  required TextEditingController t_controller,
  required String hint,
  required IconData icon,
  required String prefix,
  IconData? suffixIcon,
  VoidCallback? onSuffixTap,
}) {
  return TextField(
    controller: t_controller,
    cursorColor: AppColors.cursorColor,
    decoration: InputDecoration(
      hintText: "$hint ",
      filled: true,
      fillColor: const Color(0xffF6F7FB),
      // prefixText: prefix,
      prefix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(prefix, style: const TextStyle(fontSize: 20)),
      ),
      // prefix: Text(prefix),
      // prefixIcon: Icon(icon, color: AppColors.iconPrimaryColor),
      // filled: true,

      // fillColor: Colors.grey.shade100,
      suffixIcon: suffixIcon != null
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFF5B5CEB),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.add, color: Colors.white, size: 18),
                  onPressed: onSuffixTap,
                ),
              ),
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
