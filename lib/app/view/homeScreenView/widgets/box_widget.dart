import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_fonts.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget boxWidget({
  required BuildContext context,
  required BoxesModel boxModel,
  required String currentBoxNumber,
  required VoidCallback ontap,
  required GestureLongPressCallback onlongPress,
  required VoidCallback onQrTap,
  required VoidCallback onEdit,
  required VoidCallback onDelete,
}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onLongPress: onlongPress,
    // onTap: ontap,
    child: Container(
      width: MediaQuery.of(context).size.width * .45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Status Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xff5B5CEB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                Text(
                  "#${currentBoxNumber.toString()}",
                  style: AppTextStyles.customText(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                PopupMenuButton<String>(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 3, bottom: 3),
                    ),
                    minimumSize: MaterialStateProperty.all(Size.zero),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  elevation: 8,
                  offset: const Offset(0, 35),
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 25,
                  ),
                  onSelected: (value) {
                    switch (value) {
                      case 'qr':
                        onQrTap();
                        break;
                      case 'edit':
                        onEdit();
                        break;
                      case 'delete':
                        onDelete();
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'qr',
                      child: _menuItem(
                        icon: Icons.qr_code_2,
                        title: "View QR",
                        iconColor: const Color(0xff5B5CEB),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'edit',
                      child: _menuItem(
                        icon: Icons.edit_outlined,
                        title: "Edit",
                        iconColor: Colors.orange,
                      ),
                    ),
                    const PopupMenuDivider(height: 8),
                    PopupMenuItem(
                      value: 'delete',
                      child: _menuItem(
                        icon: Icons.delete_outline,
                        title: "Delete",
                        iconColor: Colors.red,
                        textColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppAssets.box, height: 80)),

                const SizedBox(height: 15),

                Text(
                  boxModel.boxTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.customText(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        maxLines: 2,
                        boxModel.boxLocation,
                        style: AppTextStyles.customText(
                          fontSize: 13,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.inventory_2_outlined,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${boxModel.itemCount} Items",
                            style: AppTextStyles.customText(
                              fontSize: 12,
                              color: Colors.orange.shade800,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    InkWell(
                      onTap: ontap,
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _menuItem({
  required IconData icon,
  required String title,
  required Color iconColor,
  Color textColor = Colors.black87,
}) {
  return Row(
    children: [
      Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: iconColor.withOpacity(.12),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
      const SizedBox(width: 12),
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    ],
  );
}
