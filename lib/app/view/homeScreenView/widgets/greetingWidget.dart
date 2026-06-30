import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget greetingWidget(String greetingMessage) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${greetingMessage.toString()}",
            style: AppTextStyles.customText(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Manage your storage effortlessly.",
            style: AppTextStyles.customText(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}
