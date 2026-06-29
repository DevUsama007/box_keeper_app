import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';

class NotificationUtil {
  static void showNotification(
    BuildContext context,
    String title,
    String subtitle,
    bool isError,
  ) {
    return isError
        ? ElegantNotification.error(
            animationCurve: Curves.decelerate,
            width: 330,
            position: Alignment.topCenter,
            animation: AnimationType.fromTop,
            iconSize: 50,
            verticalDividerColor: Colors.black.withOpacity(0.2),
            icon: Icon(Icons.error, color: Colors.redAccent),
            title: Text(
              title,
              style: AppTextStyles.customText(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            description: Text(
              subtitle,
              style: AppTextStyles.customText(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            displayCloseButton: true,

            // onDismiss: () {
            // },
          ).show(context)
        : ElegantNotification.success(
            width: 330,
            position: Alignment.topCenter,
            animation: AnimationType.fromTop,
            iconSize: 30,
            // icon: Icon(
            //   Icons.check_circle,
            //   color: Colors.blue,
            // ),
            verticalDividerColor: Colors.black.withOpacity(0.2),

            // progressIndicatorBackground: Colors.blue,
            title: Text(
              title,
              style: AppTextStyles.customText(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            description: Text(
              subtitle,
              style: AppTextStyles.customText(
                color: Colors.black.withOpacity(0.6),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            // onDismiss: () {
            // },
          ).show(context);
  }
}
