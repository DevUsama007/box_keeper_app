import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/view_model/homePageViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget statistics() {
  Homepageviewmodel _homepageviewModel = Get.put(Homepageviewmodel());
  return Row(
    children: [
      ValueListenableBuilder<Box<BoxesModel>>(
        valueListenable: Boxes.getBoxes().listenable(),
        builder: (context, box, child) {
          return Expanded(
            child: statCard(
              box.length.toString(),
              "Boxes",
              Icons.inventory_2_outlined,
              Colors.deepPurple,
            ),
          );
        },
      ),

      const SizedBox(width: 12),
      ValueListenableBuilder<Box<BoxesModel>>(
        valueListenable: Boxes.getBoxes().listenable(),
        builder: (context, box, child) {
          _homepageviewModel.refreshTotalItem();
          var data = box.values.toList().cast<BoxesModel>().toList();
          for (int i = 0; i < box.length; i++) {
            _homepageviewModel.getTotalItems(data[i].itemCount);
          }
          return Obx(() {
            return Expanded(
              child: statCard(
                _homepageviewModel.totalItems.toString(),
                "Items",
                Icons.widgets_outlined,
                Colors.orange,
              ),
            );
          });
        },
      ),
    ],
  );
}

Widget statCard(String value, String title, IconData icon, Color color) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: color.withOpacity(.08),
      borderRadius: BorderRadius.circular(18),
    ),
    child: Column(
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(title),
      ],
    ),
  );
}
