import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_action_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/app_bar_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/box_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/floating_action_button_widget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/greetingWidget.dart';
import 'package:box_keeper_app/app/view/homeScreenView/widgets/statistic_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      floatingActionButton: floatingActionButtonWidget(),
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
              greetingWidget().paddingSymmetric(horizontal: 10),
              const SizedBox(height: 25),

              statistics().paddingSymmetric(horizontal: 10),

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
                  TextButton(onPressed: () {}, child: const Text("View All")),
                ],
              ).paddingSymmetric(horizontal: 10),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                runAlignment: WrapAlignment.start,
                runSpacing: 10,
                children: [
                  boxWidget(context),
                  boxWidget(context),
                  boxWidget(context),
                  boxWidget(context),
                  boxWidget(context),
                  boxWidget(context),
                  boxWidget(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
