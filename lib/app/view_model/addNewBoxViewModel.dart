import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/utils/custome_snackbar_util.dart';
import 'package:box_keeper_app/app/utils/uniqueIdGenerator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBoxViewModel extends GetxController {
  final RxList<String> boxitemList = <String>[].obs;
  RxString boxcreationData = ''.obs;
  RxString uniqueId = ''.obs;
  String boxId = generateBoxId();
  updateItemBoxeList(String boxitem) {
    boxitemList.add(boxitem.toString());
  }

  delteItemBoxeList(int ind) {
    boxitemList.removeAt(ind);
  }

  getboxUniqueId() {
    uniqueId.value = generateBoxId();
  }

  getBoxCreationDate() {
    boxcreationData.value =
        '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';
  }

  fieldsVerification(
    BuildContext context,
    String boxName,
    String physicalLocation,
  ) {
    if (boxName.isEmpty) {
      NotificationUtil.showNotification(
        context,
        'Field Error',
        'Please Enter the Box Name',
        true,
      );
    } else if (physicalLocation.isEmpty) {
      NotificationUtil.showNotification(
        context,
        'Field Error',
        'Please Enter the Phsyical Location',
        true,
      );
    } else if (boxitemList.length == 0 || boxitemList.isEmpty) {
      NotificationUtil.showNotification(
        context,
        'Items List Error',
        'Please Enter The Items In The Box',
        true,
      );
    } else {
      storeBoxDataOnHive(
        boxName.toString(),
        physicalLocation.toString(),
        'Not Updated Yet',
      );
    }
  }

  storeBoxDataOnHive(
    String boxName,
    String physicalLocation,
    String qrCodePath,
  ) async {
    await getboxUniqueId();
    await getBoxCreationDate();
    final data = BoxesModel(
      uniqueID: uniqueId.value,
      qrCodePath: qrCodePath,
      boxTitle: boxName.toString(),
      boxLocation: physicalLocation.toString(),
      boxCreationDate: boxcreationData.value,
      boxItems: boxitemList,
      itemCount: boxitemList.length,
    );
    print(
      "${data.boxCreationDate}-${data.uniqueID}-${data.qrCodePath}-${data.boxItems}-${data.itemCount}",
    );
    final box = Boxes.getBoxes();
    box.add(data);
    data.save();
    print('data is saved successfuly');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    boxitemList.clear();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    boxitemList.clear();
  }
}
