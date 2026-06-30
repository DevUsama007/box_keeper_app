import 'package:box_keeper_app/app/model/hive_models/Boxes_model.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/utils/boxes.dart';
import 'package:box_keeper_app/app/utils/custome_snackbar_util.dart';
import 'package:box_keeper_app/app/utils/deleteConfirmationDialogue.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_action_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/box_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/emptyStateWidget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/floating_action_button_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/greetingWidget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/statistic_widget.dart';
import 'package:box_keeper_app/app/view/viewBoxDetailScreenView/viewBoxDetailScreenView.dart';
import 'package:box_keeper_app/app/view_model/homePageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  Homepageviewmodel _homepageviewmodel = Get.put(Homepageviewmodel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      floatingActionButton: floatingActionButtonWidget(context: context),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            children: [
              greetingWidget(
                _homepageviewmodel.greetingMessage.value.toString(),
              ).paddingSymmetric(horizontal: 10),
              const SizedBox(height: 25),

              InkWell(
                onTap: () {},
                child: statistics().paddingSymmetric(horizontal: 10),
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "My Boxes",
                    style: AppTextStyles.customText(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ).paddingSymmetric(horizontal: 10),
              SizedBox(height: 15),
              ValueListenableBuilder<Box<BoxesModel>>(
                valueListenable: Boxes.getBoxes().listenable(),
                builder: (context, box, child) {
                  if (box.values.isEmpty) {
                    return emptyState();
                  }
                  var data = box.values
                      .toList()
                      .cast<BoxesModel>()
                      .reversed
                      .toList();
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(data.length, (index) {
                      final item = data[index];
                      int boxNumber = index + 1;
                      return boxWidget(
                        onlongPress: () {
                          DeleteConfrimationDialogue.showDeleteConfirmation(
                            title: "Delete Box",
                            message:
                                "Are you sure you want to delete this box?",
                            onConfirm: () async {
                              // await Boxes.getBoxes().deleteAt(index);
                              await data[index].delete();

                              NotificationUtil.showNotification(
                                Get.context!,
                                "Deleted",
                                "Box deleted successfully.",
                                false,
                              );
                            },
                          );
                        },
                        ontap: () {
                          print(data[index].boxItems);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewBoxDetailScreenView(
                                boxModel: data[index],
                                boxIndex: index,
                              ),
                            ),
                          );
                        },
                        context: context,
                        boxModel: data[index],
                        currentBoxNumber: boxNumber.isLowerThan(10)
                            ? '00${boxNumber}'
                            : boxNumber.isLowerThan(99)
                            ? '0${boxNumber}'
                            : boxNumber.toString(),
                        onQrTap: () {},
                        onEdit: () {},
                        onDelete: () {},
                      );
                    }),
                  );
                },
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
