import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_10.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'controller/extend_images_one_controller.dart';

class ExtendImagesOneScreen extends GetWidget<ExtendImagesOneController> {
  const ExtendImagesOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 20.v),
                      decoration: AppDecoration.outlineGray,
                      child: CustomAppBar(
                          title: AppbarButton10(
                              margin: EdgeInsets.only(left: 20.h),
                              onTap: () {
                                onTapExtendimages();
                              }))),
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
                                              ImageConstant.imgRectangle7647,
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
                            SizedBox(height: 18.v),
                            Text("msg_upload_your_image2".tr,
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer),
                            SizedBox(height: 28.v),
                            Text("msg_extend_aspect_ratio".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 16.v),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(right: 10.h),
                                          padding: EdgeInsets.all(16.h),
                                          decoration: AppDecoration
                                              .outlineBlueGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("lbl_1511".tr,
                                                    style: theme
                                                        .textTheme.bodyLarge),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 91.h),
                                                    child: Text("lbl_px".tr,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]))),
                                  Expanded(
                                      child: Container(
                                          margin: EdgeInsets.only(left: 10.h),
                                          padding: EdgeInsets.all(16.h),
                                          decoration: AppDecoration
                                              .outlineBlueGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("lbl_1474".tr,
                                                    style: theme
                                                        .textTheme.bodyLarge),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 88.h),
                                                    child: Text("lbl_px".tr,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ])))
                                ]),
                            SizedBox(height: 5.v)
                          ]))
                ])),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    text: "lbl_extend".tr,
                    onTap: () {
                      onTapExtend();
                    }))));
  }

  /// Navigates to the editEightScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editEightScreen.
  onTapExtend() {
    Get.toNamed(
      AppRoutes.editEightScreen,
    );
  }

  /// Navigates to the extendImagesScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the extendImagesScreen.
  onTapExtendimages() {
    Get.toNamed(
      AppRoutes.extendImagesScreen,
    );
  }
}
