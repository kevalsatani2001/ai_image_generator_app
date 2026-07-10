import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../ai_avtar_generator_one_screen/widgets/gridillustratio_item_widget.dart';
import '../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';
import 'controller/ai_avtar_generator_one_controller.dart';

class AiAvtarGeneratorOneScreen extends StatefulWidget {
  const AiAvtarGeneratorOneScreen({super.key});

  @override
  State<AiAvtarGeneratorOneScreen> createState() => _AiAvtarGeneratorOneScreenState();
}

class _AiAvtarGeneratorOneScreenState extends State<AiAvtarGeneratorOneScreen> {
  AiAvtarGeneratorOneController controller = Get.put(AiAvtarGeneratorOneController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
      color: appTheme.white,
      child: Scaffold(
        body: GetBuilder<AiAvtarGeneratorController>(
          init: AiAvtarGeneratorController(),
          builder: (aiAvtarGeneratorController) => SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                getCommonAppBar("AI avtar generator"),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16.v),
                                Obx(() => Text(
                                      "${aiAvtarGeneratorController.userPickedPhotos.length}/5 photos have been uploaded",
                                      style: CustomTextStyles.titleMedium16_1,
                                    )),
                                SizedBox(height: 20.v),
                                Expanded(
                                  child: Obx(() {
                                    final photos = aiAvtarGeneratorController.userPickedPhotos;
                                    return GridView.builder(
                                      padding: EdgeInsets.only(bottom: 104.v),
                                      shrinkWrap: true,
                                      primary: false,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 178.v,
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20.h,
                                              crossAxisSpacing: 20.h),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: photos.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == 0) {
                                          return GestureDetector(
                                            onTap: () {
                                              aiAvtarGeneratorController.pickPhotos();
                                            },
                                            child: Container(
                                              decoration: AppDecoration.fillGray10002.copyWith(
                                                borderRadius: BorderRadiusStyle.roundedBorder8,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                    height: 48.adaptSize,
                                                    width: 48.adaptSize,
                                                    padding: EdgeInsets.all(12.h),
                                                    decoration: IconButtonStyleHelper
                                                        .fillOnErrorContainerTL24,
                                                    child: CustomImageView(
                                                      svgPath: ImageConstant.imgPlus,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.v),
                                                  Text(
                                                    "lbl_upload".tr,
                                                    style: CustomTextStyles.bodyLargePrimary,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                        return GridillustratioItemWidget(
                                          file: photos[index - 1],
                                          onDelete: () {
                                            aiAvtarGeneratorController.removePhoto(index - 1);
                                          },
                                        );
                                      },
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              color: appTheme.white,
                              child: Padding(
                                padding: EdgeInsets.only(top: 24.v, bottom: 24.v),
                                child: CustomElevatedButton(
                                  width: double.infinity,
                                  text: "lbl_generate".tr,
                                  onTap: () {
                                    onTapGenerate(aiAvtarGeneratorController);
                                  },
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTapGenerate(AiAvtarGeneratorController controller) async {
    if (controller.userPickedPhotos.length != 5) {
      Fluttertoast.showToast(
        msg: "Please upload exactly 5 photos of yourself to generate avatars.",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return;
    }

    // Show simulated progress dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 24.v),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
                  ),
                  SizedBox(height: 16.v),
                  Obx(() => Text(
                        controller.generationState.value,
                        style: theme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: 8.v),
                  Text(
                    "Applying Google AI Studio models...",
                    style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    try {
      bool success = await controller.generateAvatars();
      
      // Close loading dialog
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (success) {
        Get.toNamed(AppRoutes.editOneScreen);
      } else {
        Fluttertoast.showToast(msg: "Generation failed.");
      }
    } catch (e) {
      // Close loading dialog if open
      if (mounted) {
        Navigator.of(context).pop();
      }
      Fluttertoast.showToast(msg: "Error during generation: $e", toastLength: Toast.LENGTH_LONG);
    }
  }
}
