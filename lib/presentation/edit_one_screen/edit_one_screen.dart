import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'controller/edit_one_controller.dart';
import '../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';

class EditOneScreen extends StatefulWidget {
  const EditOneScreen({super.key});

  @override
  State<EditOneScreen> createState() => _EditOneScreenState();
}

class _EditOneScreenState extends State<EditOneScreen> {
  EditOneController controller = Get.put(EditOneController());
  final AiAvtarGeneratorController avatarController = Get.find<AiAvtarGeneratorController>();
  final GlobalKey repaintBoundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
      color: appTheme.white,
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar(
                "lbl_edit".tr,
                actionWidget: AppbarSubtitle(
                  text: "lbl_finalize".tr,
                  onTap: () {
                    onTapFinalize();
                  },
                ),
              ),
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: RepaintBoundary(
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
              ),
              SizedBox(height: 24.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "Select Avatar Style",
                  style: theme.textTheme.titleMedium,
                ),
              ),
              SizedBox(height: 12.v),
              SizedBox(
                height: 110.v,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  itemCount: avatarController.avatarStyles.length,
                  itemBuilder: (context, index) {
                    final style = avatarController.avatarStyles[index];
                    return Obx(() {
                      final isSelected = avatarController.selectedStyleIndex.value == index;
                      return GestureDetector(
                        onTap: () {
                          avatarController.selectStyle(index);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.h),
                          width: 85.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? theme.primaryColor : Colors.grey.shade300,
                              width: 2.h,
                            ),
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6.h),
                                child: Container(
                                  width: 50.h,
                                  height: 50.v,
                                  child: Obx(() {
                                    final bytes = avatarController.generatedAvatarBytes.value;
                                    if (bytes != null) {
                                      return ColorFiltered(
                                        colorFilter: ColorFilter.matrix(style['matrix'] as List<double>),
                                        child: Image.memory(
                                          bytes,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                    final path = avatarController.generatedAvatarPath.value;
                                    if (path != null && path.isNotEmpty) {
                                      return ColorFiltered(
                                        colorFilter: ColorFilter.matrix(style['matrix'] as List<double>),
                                        child: Image.file(
                                          File(path),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                    return const Icon(Icons.person, color: Colors.grey);
                                  }),
                                ),
                              ),
                              SizedBox(height: 6.v),
                              Text(
                                style['name'] as String,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  color: isSelected ? theme.primaryColor : Colors.grey.shade700,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
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
                  width: 177.h,
                  text: "lbl_download".tr,
                  onTap: () {
                    _captureAndSaveImage();
                  },
                ),
              ],
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

  void onTapEdit() {
    Get.toNamed(AppRoutes.aiAvtarGeneratorTwoScreen);
  }

  void onTapFinalize() {
    Get.toNamed(AppRoutes.finalizeTwoScreen);
  }
}
