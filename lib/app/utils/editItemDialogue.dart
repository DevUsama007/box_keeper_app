import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditItemDialog {
  static void show({
    required String currentItem,
    required Function(String updatedItem) onSave,
  }) {
    final TextEditingController controller = TextEditingController(
      text: currentItem,
    );

    Get.defaultDialog(
      title: "",
      radius: 20,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: const Color(0xff5B5CEB).withOpacity(.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.edit_rounded,
              color: Color(0xff5B5CEB),
              size: 36,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Edit Item",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          const Text(
            "Update the item name below.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: controller,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter item name",
              prefixIcon: const Icon(Icons.inventory_2_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),

          const SizedBox(height: 25),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text("Cancel"),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final value = controller.text.trim();

                    if (value.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Item name cannot be empty",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    // Get.back();
                    onSave(value);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5B5CEB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
