import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_2.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'controller/photo_to_anime_two_controller.dart';

class PhotoToAnimeTwoScreen extends GetWidget<PhotoToAnimeTwoController> {
  const PhotoToAnimeTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 17.v),
                      decoration: AppDecoration.outlineGray,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SizedBox(height: 6.v),
                        CustomAppBar(
                            title: AppbarButton2(
                                margin: EdgeInsets.only(left: 20.h),
                                onTap: () {
                                  onTapPhototoanime();
                                }))
                      ])),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 374.adaptSize,
                                width: 374.adaptSize,
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgRectangle764,
                                          height: 374.adaptSize,
                                          width: 374.adaptSize,
                                          radius: BorderRadius.circular(8.h),
                                          alignment: Alignment.center),
                                      CustomIconButton(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          margin: EdgeInsets.only(
                                              top: 16.v, right: 16.h),
                                          padding: EdgeInsets.all(2.h),
                                          alignment: Alignment.topRight,
                                          child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgCloseOnerrorcontainer))
                                    ])),
                            Container(
                                width: 362.h,
                                margin: EdgeInsets.only(
                                    top: 17.v, right: 11.h, bottom: 5.v),
                                child: Text("msg_upload_your_photo2".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodyLargeOnPrimaryContainer
                                        .copyWith(height: 1.50)))
                          ]))
                ])),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    text: "lbl_generate".tr,
                    onTap: () {
                      onTapGenerate();
                    }))));
  }

  /// Navigates to the editArtworkOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editArtworkOneScreen.
  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editArtworkOneScreen,
    );
  }

  /// Navigates to the photoToAnimeThreeScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the photoToAnimeThreeScreen.
  onTapPhototoanime() {
    Get.toNamed(
      AppRoutes.photoToAnimeThreeScreen,
    );
  }
}
