import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_fonts.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Widget boxWidget(BuildContext context) {
//   return Container(
//     width: MediaQuery.sizeOf(context).width * 0.45,
//     decoration: BoxDecoration(
//       border: Border(
//         top: BorderSide(color: Colors.red, width: 4),
//         bottom: BorderSide(color: Colors.black.withAlpha(100)),
//         left: BorderSide(color: Colors.black.withAlpha(100)),
//         right: BorderSide(color: Colors.black.withAlpha(100)),
//       ),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '#001',
//               style: AppTextStyles.customText(fontSize: 12, color: Colors.grey),
//             ),
//             Icon(
//               Icons.arrow_forward_ios_rounded,
//               size: 15,
//               color: Colors.black.withAlpha(160),
//             ),
//           ],
//         ),
//         Center(child: Image.asset(AppAssets.box, width: 700, height: 70)),
//         Text(
//           "Winter Clothes",
//           style: AppTextStyles.customText(fontSize: 14, color: Colors.black),
//         ).paddingOnly(top: 2, bottom: 3),
//         Row(
//           children: [
//             Icon(Icons.location_on_outlined, size: 15).paddingOnly(bottom: 3),
//             Text(
//               'Attic',
//               style: AppTextStyles.customText(
//                 fontSize: 15,
//                 color: Colors.grey,
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 2,
//                 fontfamily: AppFonts.leagueSpart,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '5 items',
//               style: AppTextStyles.customText(
//                 color: Colors.grey,
//                 fontSize: 14,
//                 fontfamily: AppFonts.leagueSpart,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(3),
//               decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(0.1),
//                 border: Border.all(color: Colors.green),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.qr_code, size: 18),
//                   SizedBox(width: 4),
//                   Text('QR', style: AppTextStyles.customText(fontSize: 12)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     ).paddingSymmetric(horizontal: 10, vertical: 10),
//   );
// }
Widget boxWidget(BuildContext context) {
  return Container(
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
                "#001",
                style: AppTextStyles.customText(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.qr_code_2, size: 15, color: Colors.white),
                    const SizedBox(width: 4),
                    Text(
                      "QR",
                      style: AppTextStyles.customText(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
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
                "Winter Clothes",
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
                      "Attic",
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
                          "5 Items",
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
                    onTap: () {},
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
  );
}
