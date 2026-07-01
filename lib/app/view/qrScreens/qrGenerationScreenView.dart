import 'dart:typed_data';

import 'package:box_keeper_app/app/custom_widgets/customAppBarWidet.dart';
import 'package:box_keeper_app/app/custom_widgets/custom_button_widget.dart';
import 'package:box_keeper_app/app/custom_widgets/successSnackbarWidget.dart';
import 'package:box_keeper_app/app/res/app_assets.dart';
import 'package:box_keeper_app/app/res/app_colors.dart';
import 'package:box_keeper_app/app/res/app_text_styles.dart';
import 'package:box_keeper_app/app/utils/custome_snackbar_util.dart';
import 'package:box_keeper_app/app/utils/permissionHandler.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrGenerationScreenView extends StatefulWidget {
  final String boxId;

  const QrGenerationScreenView({super.key, required this.boxId});

  @override
  State<QrGenerationScreenView> createState() => _QrGenerationScreenViewState();
}

class _QrGenerationScreenViewState extends State<QrGenerationScreenView> {
  final ScreenshotController _controller = ScreenshotController();

  bool _isSaving = false;

  Future<void> saveQr() async {
    setState(() {
      _isSaving = true;
    });

    try {
      final hasPermission = await PermissionHandler.requestStoragePermissions();

      if (!hasPermission) {
        setState(() {
          _isSaving = false;
        });
        NotificationUtil.showNotification(
          context,
          "Permission Denied",
          "Storage and Photos permissions are required to save the QR code.",
          true,
        );

        openAppSettings();
        return;
      }

      Uint8List? image = await _controller.capture(pixelRatio: 3);

      if (image != null) {
        setState(() {
          _isSaving = true;
        });
        await ImageGallerySaverPlus.saveImage(
          image,
          quality: 100,
          name: "BOX_${widget.boxId}",
        );
        final result = await ImageGallerySaverPlus.saveImage(
          image,
          quality: 100,
          name: "BOX_${widget.boxId}",
        );

        if (mounted) {
          successSnackbarWidget.show(
            onOkPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            context: context,
            title: "✔ QR Code saved successfully!",
            message: "You can find it in your Gallery under: Pictures",
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    setState(() {
      _isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),

      appBar: customAppBarWidget(
        context: context,
        title: "Box Track",
        subtitle: "Storage Inventory System",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Screenshot(
                  controller: _controller,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Image.asset(AppAssets.box, height: 70),
                        Text(
                          'Box Keeper',
                          style: AppTextStyles.customText(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.iconButtonbackgroundColor,
                          ),
                        ),

                        const SizedBox(height: 10),

                        QrImageView(
                          data: widget.boxId,
                          size: 200,
                          gapless: true,
                          version: QrVersions.auto,
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Scan this QR to identify the box.",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 10),

                        SelectableText(
                          widget.boxId,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            customButtonWidget(
              context: context,
              ontap: () {
                saveQr();
              },
              title: _isSaving ? "Saving..." : "Save QR to Gallery",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
