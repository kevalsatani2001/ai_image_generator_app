import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_11.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'controller/controlnet_controller.dart';

class ControlnetScreen extends GetWidget<ControlnetController> {
  const ControlnetScreen({Key? key}) : super(key: key);

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
                            title: AppbarButton11(
                                margin: EdgeInsets.only(left: 20.h),
                                onTap: () {
                                  onTapControlnet();
                                }))
                      ])),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgRectangle76413,
                                height: 374.adaptSize,
                                width: 374.adaptSize,
                                radius: BorderRadius.circular(8.h)),
                            Container(
                                width: 348.h,
                                margin: EdgeInsets.only(top: 17.v, right: 25.h),
                                child: Text("msg_upload_models_stickman".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodyLargeOnPrimaryContainer
                                        .copyWith(height: 1.50))),
                            SizedBox(height: 26.v),
                            Text("lbl_enter_prompt".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 15.v),
                            Container(
                                width: 374.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.h, vertical: 17.v),
                                decoration: AppDecoration.outlineBluegray100
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Container(
                                    width: 312.h,
                                    margin: EdgeInsets.only(right: 29.h),
                                    child: Text("msg_this_is_where_you_ll".tr,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyLarge!
                                            .copyWith(height: 1.50)))),
                            SizedBox(height: 5.v)
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

  /// Navigates to the editFiveScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editFiveScreen.
  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editFiveScreen,
    );
  }

  /// Navigates to the controlnetOneScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the controlnetOneScreen.
  onTapControlnet() {
    Get.toNamed(
      AppRoutes.controlnetOneScreen,
    );
  }
}
