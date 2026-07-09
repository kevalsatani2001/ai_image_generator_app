import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'controller/explore_prompt_photo_detail_popup_controller.dart';



class ExplorePromptPhotoDetailPopupScreen extends StatefulWidget {
  const ExplorePromptPhotoDetailPopupScreen({super.key});

  @override
  State<ExplorePromptPhotoDetailPopupScreen> createState() => _ExplorePromptPhotoDetailPopupScreenState();
}

class _ExplorePromptPhotoDetailPopupScreenState extends State<ExplorePromptPhotoDetailPopupScreen> {
  ExplorePromptPhotoDetailPopupController controller = Get.put(ExplorePromptPhotoDetailPopupController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {

      },
      child: SizedBox(

          width: double.maxFinite,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.h, vertical: 24.v),
                decoration: AppDecoration.white.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL16),
                child:
                Column(mainAxisSize: MainAxisSize.min, children: [
                  CustomImageView(
                      svgPath: ImageConstant.imgClose,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      alignment: Alignment.centerRight,
                      onTap: () {
                        Get.back();
                      }),
                  CustomImageView(
                      imagePath:
                      controller.currentImageData!.image,
                      height: 244.adaptSize,
                      width: 244.adaptSize,
                      radius: BorderRadius.circular(8.h)),
                  Container(
                      width: 365.h,
                      margin: EdgeInsets.only(
                          left: 3.h, top: 24.v, right: 4.h),
                      child: Text(controller.currentImageData!.description!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(height: 1.50))),
                  SizedBox(height: 48.v),
                  CustomElevatedButton(
                      text: "lbl_try".tr,
                      onTap: () {
                        onTapTry();
                      }),

                ]))
          ])),
    );
  }

  onTapImgCloseone() {
    Get.toNamed(
      AppRoutes.explorePromptScreen,
    );
  }

  onTapTry() {
    Get.toNamed(
      AppRoutes.editArtworkScreen,
    );
  }
}






