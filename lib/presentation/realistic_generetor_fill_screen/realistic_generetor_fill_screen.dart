import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_6.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'controller/realistic_generetor_fill_controller.dart';

class RealisticGeneretorFillScreen
    extends GetWidget<RealisticGeneretorFillController> {
  const RealisticGeneretorFillScreen({Key? key}) : super(key: key);

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
                          title: AppbarButton6(
                              margin: EdgeInsets.only(left: 20.h),
                              onTap: () {
                                onTapRealistic();
                              }))),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(children: [
                        SizedBox(
                            height: 374.adaptSize,
                            width: 374.adaptSize,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              CustomImageView(
                                  imagePath:
                                      ImageConstant.imgRectangle764374x374,
                                  height: 374.adaptSize,
                                  width: 374.adaptSize,
                                  radius: BorderRadius.circular(8.h),
                                  alignment: Alignment.center),
                              CustomIconButton(
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin:
                                      EdgeInsets.only(top: 16.v, right: 16.h),
                                  padding: EdgeInsets.all(2.h),
                                  alignment: Alignment.topRight,
                                  child: CustomImageView(
                                      svgPath: ImageConstant
                                          .imgCloseOnerrorcontainer))
                            ])),
                        SizedBox(height: 17.v),
                        SizedBox(
                            width: 371.h,
                            child: Text("msg_you_can_upload_sketches".tr,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer
                                    .copyWith(height: 1.50))),
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

  /// Navigates to the editTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editTwoScreen.
  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editTwoScreen,
    );
  }

  /// Navigates to the realisticGeneretorScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the realisticGeneretorScreen.
  onTapRealistic() {
    Get.toNamed(
      AppRoutes.realisticGeneretorScreen,
    );
  }
}
