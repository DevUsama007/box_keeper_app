import 'package:box_keeper_app/app/custom_widgets/icon_button_widget.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBarWidget({
  required BuildContext context,
  required String title,
  required String subtitle,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 60,
    elevation: 0,
    scrolledUnderElevation: 0,

    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    titleSpacing: 20,

    title: Row(
      children: [
        iconButtonWidget(
          b_width: 35,
          b_hight: 35,
          backgroundColor: const Color(0xFF5B5CEB),
          icon: Icons.arrow_back,
          iconColor: Colors.white,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.customText(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.customText(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ],
    ),
  );
}
