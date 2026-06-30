import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/utils/get_Greeting_util.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class Homepageviewmodel extends GetxController {
  RxInt totalItems = 0.obs;
  RxString greetingMessage = ''.obs;

  // Future<void> getTotalBoxes() async {
  //   final box = Boxes.getBoxes();

  //   for (final item in box.values) {
  //     print('ID: ${item.uniqueID}');
  //     print('Title: ${item.boxTitle}');
  //     print('Location: ${item.boxLocation}');
  //     print('Date: ${item.boxCreationDate}');
  //     print('Items: ${item.boxItems}');
  //     print('Count: ${item.itemCount}');
  //     print('----------------------');
  //   }
  // }

  getTotalItems(int itemCount) {
    totalItems.value = totalItems.value + itemCount;
  }

  refreshTotalItem() {
    totalItems.value = 0;
  }

  updateGreetingMessage() {
    greetingMessage.value = getGreetingMessage();
  }

  startApp() async {
    await updateGreetingMessage();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    startApp();
  }
}
