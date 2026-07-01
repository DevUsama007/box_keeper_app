import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/utils/custome_snackbar_util.dart';
import 'package:box_keeper_app/app/utils/uniqueIdGenerator.dart';
import 'package:box_keeper_app/app/view/qrScreens/qrGenerationScreenView.dart';
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

  updateItemAtIndex(int ind, String boxitem) {
    boxitemList[ind] = boxitem;
  }

  updateItemListComplete(List<String> itemList) {
    boxitemList.addAll(itemList);
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

  fieldsVerification({
    required BuildContext context,
    required String boxName,
    required String physicalLocation,
    required bool isUpdating,
  }) {
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
        context,
      );
    }
  }

  storeBoxDataOnHive(
    String boxName,
    String physicalLocation,
    String qrCodePath,
    BuildContext context,
  ) async {
    await getboxUniqueId();
    await getBoxCreationDate();
    final data = BoxesModel(
      uniqueID: uniqueId.value,
      qrCodePath: qrCodePath,
      boxTitle: boxName.toString(),
      boxLocation: physicalLocation.toString(),
      boxCreationDate: boxcreationData.value,
      // boxItems: boxitemList,
      boxItems: List<String>.from(boxitemList),
      itemCount: boxitemList.length,
    );
    print(
      "${data.boxCreationDate}-${boxitemList}-${data.uniqueID}-${data.qrCodePath}-${data.boxItems}-${data.itemCount}",
    );
    print(data.boxItems);
    final box = await Boxes.getBoxes();
    await box.add(data);
    await data.save();
    NotificationUtil.showNotification(
      context,
      "Success",
      "Data is saved Successfuly",
      false,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QrGenerationScreenView(boxId: uniqueId.value),
      ),
    );
  }

  updateBoxDataOnHive(
    String boxName,
    String physicalLocation,
    BoxesModel boxModel,
    BuildContext context,
  ) async {
    boxModel.boxTitle = boxName;
    boxModel.boxLocation = physicalLocation;
    // boxModel.boxItems = boxitemList;
    boxModel.boxItems = List<String>.from(boxitemList);
    boxModel.itemCount = boxitemList.length;

    // final box = Boxes.getBoxes();
    // box.add(data);
    boxModel.save();
    NotificationUtil.showNotification(
      context,
      "Success",
      "Data is updated Successfuly",
      false,
    );
    Navigator.pop(context);
    // data.save();
    print('data is saved successfuly');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
