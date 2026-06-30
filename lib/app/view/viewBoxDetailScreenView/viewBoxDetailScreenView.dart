import 'package:box_keeper_app/app/custom_widgets/icon_button_widget.dart';
import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/utils/custome_snackbar_util.dart';
import 'package:box_keeper_app/app/utils/deleteConfirmationDialogue.dart';
import 'package:box_keeper_app/app/view/addNewBoxScreenView/Widgets/addBoxTextFieldWidget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_action_widget.dart';
import 'package:box_keeper_app/app/view_model/addNewBoxViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:hive_flutter/adapters.dart';

class ViewBoxDetailScreenView extends StatefulWidget {
  BoxesModel boxModel;
  int boxIndex;
  ViewBoxDetailScreenView({
    super.key,
    required this.boxModel,
    required this.boxIndex,
  });

  @override
  State<ViewBoxDetailScreenView> createState() =>
      _ViewBoxDetailScreenViewState();
}

class _ViewBoxDetailScreenViewState extends State<ViewBoxDetailScreenView> {
  TextEditingController boxNameController = TextEditingController();
  TextEditingController boxLocationController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  AddNewBoxViewModel _addNewBoxViewModel = Get.put(AddNewBoxViewModel());
  updateValues() {
    boxNameController.text = widget.boxModel.boxTitle.toString();
    boxLocationController.text = widget.boxModel.boxLocation.toString();
    _addNewBoxViewModel.updateItemListComplete(widget.boxModel.boxItems);
    setState(() {});
    print(widget.boxModel.boxItems);
    print(_addNewBoxViewModel.boxitemList.toString());
  }

  update() {
    widget.boxModel.boxTitle = boxNameController.text;
    widget.boxModel.save();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized;

    _addNewBoxViewModel.boxitemList.clear();
    updateValues();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _addNewBoxViewModel.boxitemList.clear();
    boxNameController.dispose();
    boxLocationController.dispose();
    itemController.dispose();
    // _addNewBoxViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        elevation: 0,
        scrolledUnderElevation: 0,

        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleSpacing: 20,

        title: Row(
          children: [
            iconButtonWidget(
              b_width: 35,
              b_hight: 35,
              backgroundColor: const Color(0xFF5B5CEB),
              icon: Icons.arrow_back,
              iconColor: Colors.white,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.boxModel.uniqueID}",
                  style: AppTextStyles.customText(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Added ${widget.boxModel.boxCreationDate}",
                  style: AppTextStyles.customText(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _boxNameWidget(),
              SizedBox(height: 10),
              _boxlocationWidget(),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // color: AppColors.borderPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderPrimaryColor),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('📋 Items'),
                        Obx(() {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff5B5CEB),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              _addNewBoxViewModel.boxitemList.length.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ],
                    ).paddingOnly(left: 10, right: 10, top: 10, bottom: 5),
                    Divider(
                      color: Colors.grey,
                    ).paddingSymmetric(horizontal: 20),
                    SizedBox(height: 10),
                    Obx(() {
                      return Column(
                        children: List.generate(
                          _addNewBoxViewModel.boxitemList.length,
                          (index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 10,
                                left: 5,
                                right: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                            "#${index + 1}",
                                          ).paddingOnly(right: 10),
                                          Text(
                                            _addNewBoxViewModel
                                                .boxitemList[index],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      InkWell(
                                        focusColor: Colors.red,
                                        highlightColor: Colors.red,
                                        radius: 10,
                                        onTap: () {
                                          NotificationUtil.showNotification(
                                            context,
                                            "Error",
                                            "There are some issue here",
                                            false,
                                          );
                                          print(Boxes.getBoxes().length);
                                        },
                                        child: Text(
                                          '✏️',
                                          style: TextStyle(fontSize: 16),
                                        ).paddingOnly(right: 10, left: 10),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          DeleteConfrimationDialogue.showDeleteConfirmation(
                                            title: "Delete Item",
                                            message:
                                                "Are you sure you want to delete this Item?",
                                            onConfirm: () async {
                                              // await Boxes.getBoxes().deleteAt(index);
                                              _addNewBoxViewModel
                                                  .delteItemBoxeList(index);
                                              NotificationUtil.showNotification(
                                                Get.context!,
                                                "Deleted",
                                                "Item deleted successfully.",
                                                false,
                                              );
                                              Get.back();
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete_outline_sharp,
                                          color: Colors.red,
                                        ),
                                      ).paddingSymmetric(vertical: 5),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    SizedBox(height: 10),
                    addBoxTextFieldWidget(
                      prefix: '📦',
                      t_controller: itemController,
                      hint: 'Type an item and press add',
                      icon: Icons.text_fields_rounded,
                      suffixIcon: Icons.add,
                      onSuffixTap: () {
                        _addNewBoxViewModel.updateItemBoxeList(
                          itemController.text.toString(),
                        );
                        itemController.clear();
                      },
                    ).paddingOnly(bottom: 10, left: 10, right: 10),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _createBoxButton(
                ontap: () {
                  // _addNewBoxViewModel.fieldsVerification(
                  //   context: context,
                  //   boxName: boxNameController.text.toString(),
                  //   physicalLocation: boxLocationController.text.toString(),
                  //   isUpdating: true,
                  // );
                  _addNewBoxViewModel.updateBoxDataOnHive(
                    boxNameController.text,
                    boxLocationController.text,
                    widget.boxModel,
                    context,
                  );
                },
              ).paddingOnly(bottom: 40),
              SizedBox(width: 50),
            ],
          ),
        ).paddingSymmetric(horizontal: 20, vertical: 10),
      ),
    );
  }

  Widget _boxNameWidget() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 15),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Box Name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.customText(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          addBoxTextFieldWidget(
            prefix: '📦',
            icon: Icons.title,
            t_controller: boxNameController,
            hint: 'e.g Summer Clothes',
          ),
        ],
      ),
    );
  }

  Widget _boxlocationWidget() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 15),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Physical Location',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.customText(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          addBoxTextFieldWidget(
            prefix: '📍',
            icon: Icons.location_on,
            t_controller: boxLocationController,
            hint: 'e.g Attic-Shelf A',
          ),
        ],
      ),
    );
  }

  Widget _createBoxButton({required VoidCallback ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xff5B5CEB), Color(0xff7A5AF8)],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.box,
              width: 25,
              height: 25,
              color: Colors.white,
            ).paddingOnly(right: 5),

            Text(
              'Update Box',
              style: AppTextStyles.customText(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
