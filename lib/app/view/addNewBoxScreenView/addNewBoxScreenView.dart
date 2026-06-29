import 'package:box_keeper_app/app/custom_widgets/icon_button_widget.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/view/addNewBoxScreenView/Widgets/addBoxTextFieldWidget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_action_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewBoxScreenView extends StatefulWidget {
  const AddNewBoxScreenView({super.key});

  @override
  State<AddNewBoxScreenView> createState() => _AddNewBoxScreenViewState();
}

class _AddNewBoxScreenViewState extends State<AddNewBoxScreenView> {
  TextEditingController boxNameController = TextEditingController();
  TextEditingController boxLocationController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  List<String> itemsList = [
    'Books',
    'Pensile Box',
    'Dairy',
    'Mobile Charger',
    'Laptop Charger',
    'Keyboard',
    'Books',
    'Pensile Box',
    'Dairy',
    'Mobile Charger',
    'Laptop Charger',
    'Keyboard',
  ];
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
                  "Add New Box",
                  style: AppTextStyles.customText(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Create a storage box and generate a QR code.",
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff5B5CEB),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            "12",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        // RichText(
                        //   text: TextSpan(
                        //     children: [
                        //       TextSpan(
                        //         text: '${itemsList.length} ',
                        //         style: AppTextStyles.customText(fontSize: 12),
                        //       ),

                        //       TextSpan(
                        //         text: 'added',
                        //         style: AppTextStyles.customText(
                        //           fontSize: 13,
                        //           color: Colors.grey,
                        //         ),
                        //       ),
                        //     ],

                        //     style: AppTextStyles.customText(),
                        //   ),
                        // ),
                      ],
                    ).paddingOnly(left: 10, right: 10, top: 10, bottom: 5),
                    Divider(
                      color: Colors.grey,
                    ).paddingSymmetric(horizontal: 20),
                    SizedBox(height: 10),
                    Column(
                      children: List.generate(itemsList.length, (index) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("#${index + 1}").paddingOnly(right: 10),
                                  Text(itemsList[index]),
                                ],
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    focusColor: Colors.red,
                                    highlightColor: Colors.red,
                                    radius: 10,
                                    onTap: () {
                                      print('object');
                                    },
                                    child: Text(
                                      '✏️',
                                      style: TextStyle(fontSize: 16),
                                    ).paddingOnly(right: 10, left: 10),
                                  ),

                                  IconButton(
                                    onPressed: () {},
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
                      }),
                    ),
                    SizedBox(height: 10),
                    addBoxTextFieldWidget(
                      prefix: '📦',
                      t_controller: itemController,
                      hint: 'Type an item and press add',
                      icon: Icons.text_fields_rounded,
                      suffixIcon: Icons.add,
                      onSuffixTap: () {},
                    ).paddingOnly(bottom: 10, left: 10, right: 10),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _createBoxButton(ontap: () {}).paddingOnly(bottom: 40),
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
              'Create Box & Generate QR',
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
