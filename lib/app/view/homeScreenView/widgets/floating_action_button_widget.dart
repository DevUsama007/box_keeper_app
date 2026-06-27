import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/material.dart';

Widget floatingActionButtonWidget(){
  return Container(
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xFF5B5CEB), Color(0xFF7A5AF8)],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5B5CEB).withOpacity(.35),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          icon: const Icon(Icons.add_box_rounded, size: 24),
          label: Text(
            "Add Box",
            style: AppTextStyles.customText(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      );
    
}