import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'controller/finalize_two_controller.dart';
import '../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';

class FinalizeTwoScreen extends StatefulWidget {
  const FinalizeTwoScreen({super.key});

  @override
  State<FinalizeTwoScreen> createState() => _FinalizeTwoScreenState();
}

class _FinalizeTwoScreenState extends State<FinalizeTwoScreen> {
  FinalizeTwoController controller = Get.put(FinalizeTwoController());
  final AiAvtarGeneratorController avatarController = Get.find<AiAvtarGeneratorController>();
  final GlobalKey repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: ColorfulSafeArea(
        color: appTheme.white,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                getCommonAppBar("lbl_finalize".tr),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RepaintBoundary(
                        key: repaintBoundaryKey,
                        child: Obx(() {
                          final bytes = avatarController.generatedAvatarBytes.value;
                          if (bytes != null) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(avatarController.selectedStyleMatrix),
                                child: Image.memory(
                                  bytes,
                                  height: 374.adaptSize,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }
                          final path = avatarController.generatedAvatarPath.value;
                          if (path != null && path.isNotEmpty) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.matrix(avatarController.selectedStyleMatrix),
                                child: Image.file(
                                  File(path),
                                  height: 374.adaptSize,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          }
                          return CustomImageView(
                            imagePath: ImageConstant.imgIllustrationha24,
                            height: 374.adaptSize,
                            width: double.infinity,
                            radius: BorderRadius.circular(8.h),
                          );
                        }),
                      ),
                      SizedBox(height: 26.v),
                      Text("lbl_add_title".tr, style: theme.textTheme.titleMedium),
                      SizedBox(height: 18.v),
                      CustomTextFormField(
                        controller: controller.actionBeautyfulController,
                        hintText: "msg_beautyful_women".tr,
                        textInputAction: TextInputAction.done,
                        borderDecoration: TextFormFieldStyleHelper.fillGrayTL16,
                        fillColor: appTheme.gray50,
                      ),
                      SizedBox(height: 5.v),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
            decoration: AppDecoration.white,
            child: Container(
              decoration: AppDecoration.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomOutlinedButton(
                    width: 173.h,
                    text: "lbl_share".tr,
                    onTap: () {
                      Fluttertoast.showToast(msg: "Sharing avatar...");
                    },
                  ),
                  CustomElevatedButton(
                    onTap: () {
                      _captureAndSaveImage();
                    },
                    width: 177.h,
                    text: "lbl_download".tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _captureAndSaveImage() async {
    try {
      RenderRepaintBoundary? boundary = repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        Fluttertoast.showToast(msg: "Failed to locate rendering context.");
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

      Navigator.of(context).pop(); // dismiss loader

      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final result = await ImageGallerySaverPlus.saveImage(
          pngBytes,
          quality: 100,
          name: "AI_Avatar_${DateTime.now().millisecondsSinceEpoch}",
        );
        if (result != null && (result['isSuccess'] == true || result['filePath'] != null)) {
          getDownloadDialogue(context, () {});
        } else {
          Fluttertoast.showToast(msg: "Failed to save avatar image.");
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Error saving: $e");
    }
  }

  void onTapArrowleftone() {
    Get.back();
  }
}
