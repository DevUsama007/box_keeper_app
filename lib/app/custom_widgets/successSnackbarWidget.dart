import 'package:box_keeper_app/app/custom_widgets/custom_button_widget.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class successSnackbarWidget {
  static void show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onOkPressed,
  }) {
    Get.defaultDialog(
      title: "",
      radius: 20,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: Column(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.success, width: 100, height: 100),
          Text(
            title,
            style: AppTextStyles.customText(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            maxLines: 2,
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.customText(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          customButtonWidget(
            context: context,
            ontap: onOkPressed,
            title: "OK",
          ).paddingSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}
