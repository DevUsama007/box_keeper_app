import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:box_keeper_app/app/res/app_fonts.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget emptyState() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.iconButtonbackgroundColor.withOpacity(.08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.inventory_2_outlined,
              size: 55,
              color: AppColors.iconButtonbackgroundColor,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            "No Boxes Yet",
            style: AppTextStyles.customText(
              fontSize: 20,
              fontfamily: AppFonts.patuaOne,
              fontWeight: FontWeight.w300,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Create your first box to start managing",
            textAlign: TextAlign.center,
            style: AppTextStyles.customText(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
