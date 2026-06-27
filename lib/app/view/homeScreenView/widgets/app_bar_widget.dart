import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_action_widget.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(){
  return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 90,
        elevation: 0,
        scrolledUnderElevation: 0,

        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF5B5CEB),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  AppAssets.box,
                  width: 35,
                  height: 35,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Box Track",
                  style: AppTextStyles.customText(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "Storage Inventory System",
                  style: AppTextStyles.customText(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          const SizedBox(width: 10),
          appbarActionButton(
            icon: Icons.qr_code_scanner_rounded,
            onTap: () {
              print('object');
            },
            backgroundColor: const Color(0xFF5B5CEB),
            iconColor: Colors.white,
          ),
          const SizedBox(width: 20),
        ],
      );

    
}