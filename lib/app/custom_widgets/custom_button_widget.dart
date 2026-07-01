import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customButtonWidget({
  required BuildContext context,
  required VoidCallback ontap,
  required String title,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff5B5CEB), Color(0xff7A5AF8)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(
          title,
          style: AppTextStyles.customText(fontSize: 14, color: Colors.white),
        ),
      ),
    ),
  );
}
