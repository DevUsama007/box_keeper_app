import 'package:box_keeper_app/app/utils/get_Greeting_util.dart';
import 'package:get/get.dart';

class Homepageviewmodel extends GetxController {
  RxInt totalBoxes = 0.obs;
  RxInt totalItems = 0.obs;
  RxString greetingMessage = ''.obs;
  updateGreetingMessage() {
    greetingMessage.value = getGreetingMessage();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateGreetingMessage();
  }
}
