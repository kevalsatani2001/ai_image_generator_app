import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'controller/more_popup_one_controller.dart';

class MorePopupOneScreen extends GetWidget<MorePopupOneController> {
  const MorePopupOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.all(20.h),
                          decoration: AppDecoration.outlineGray,
                          child: CustomElevatedButton(
                              height: 33.v,
                              width: 198.h,
                              text: "lbl_artwork_post".tr,
                              leftIcon: Container(
                                  margin: EdgeInsets.only(right: 16.h),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowleft)),
                              buttonStyle: CustomButtonStyles.none,
                              buttonTextStyle: theme.textTheme.headlineSmall!,
                              onTap: () {
                                onTapArtworkpost();
                              })),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 20.h, top: 16.v, right: 20.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 16.v),
                              decoration: AppDecoration.fillGray10002.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 398.v,
                                        width: 358.h,
                                        child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Row(children: [
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgEllipse236,
                                                            height:
                                                                40.adaptSize,
                                                            width: 40.adaptSize,
                                                            radius: BorderRadius
                                                                .circular(
                                                                    20.h)),
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 11.h,
                                                                    top: 10.v,
                                                                    bottom:
                                                                        7.v),
                                                            child: Text(
                                                                "lbl_quick_john"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .titleMedium16_1))
                                                      ]))),
                                              Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: SizedBox(
                                                      height: 342.v,
                                                      width: 358.h,
                                                      child: Stack(
                                                          alignment:
                                                              Alignment.center,
                                                          children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgIllustrationha340x358,
                                                                height: 340.v,
                                                                width: 358.h,
                                                                radius:
                                                                    BorderRadius
                                                                        .circular(9
                                                                            .h),
                                                                alignment:
                                                                    Alignment
                                                                        .center),
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Container(
                                                                    height:
                                                                        342.v,
                                                                    width:
                                                                        358.h,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8
                                                                                .h),
                                                                        gradient: LinearGradient(
                                                                            begin:
                                                                                Alignment(0.04, 0.07),
                                                                            end: Alignment(0.98, 1),
                                                                            colors: [
                                                                              appTheme.black900.withOpacity(0.64),
                                                                              appTheme.black900.withOpacity(0)
                                                                            ]))))
                                                          ]))),
                                              CustomIconButton(
                                                  height: 32.v,
                                                  width: 33.h,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, right: 8.h),
                                                  padding: EdgeInsets.all(4.h),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .fillBlueGray,
                                                  alignment: Alignment.topRight,
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgOverflowmenu)),
                                              CustomElevatedButton(
                                                  height: 32.v,
                                                  width: 94.h,
                                                  text: "lbl_remix".tr,
                                                  margin: EdgeInsets.only(
                                                      top: 4.v, right: 49.h),
                                                  buttonTextStyle: CustomTextStyles
                                                      .titleMediumOnErrorContainerSemiBold,
                                                  alignment:
                                                      Alignment.topRight),
                                              Align(
                                                  alignment: Alignment.topRight,
                                                  child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 24.v,
                                                          right: 16.h),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 16.h,
                                                              vertical: 14.v),
                                                      decoration: AppDecoration
                                                          .white
                                                          .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder8),
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgRewind,
                                                                  height: 24
                                                                      .adaptSize,
                                                                  width: 24
                                                                      .adaptSize),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left: 12
                                                                              .h),
                                                                  child: Text(
                                                                      "lbl_save_art"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyLarge))
                                                            ]),
                                                            SizedBox(
                                                                height: 16.v),
                                                            Row(children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgDownload,
                                                                  height: 24
                                                                      .adaptSize,
                                                                  width: 24
                                                                      .adaptSize),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left: 16
                                                                              .h),
                                                                  child: Text(
                                                                      "lbl_download_art"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyLarge))
                                                            ]),
                                                            SizedBox(
                                                                height: 16.v),
                                                            CustomElevatedButton(
                                                                height: 25.v,
                                                                width: 92.h,
                                                                text:
                                                                    "lbl_report"
                                                                        .tr,
                                                                leftIcon: Container(
                                                                    margin: EdgeInsets.only(
                                                                        right: 16
                                                                            .h),
                                                                    child: CustomImageView(
                                                                        svgPath: ImageConstant
                                                                            .imgIcDanger)),
                                                                buttonStyle:
                                                                    CustomButtonStyles
                                                                        .none,
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .bodyLarge!,
                                                                onTap: () {
                                                                  onTapReport();
                                                                })
                                                          ])))
                                            ])),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 8.h, top: 16.v),
                                        child: Row(children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgFavorite,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.h),
                                              child: Text("lbl_24".tr,
                                                  style: CustomTextStyles
                                                      .titleMedium16_1)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgSend,
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                              margin:
                                                  EdgeInsets.only(left: 24.h))
                                        ]))
                                  ]))),
                      Padding(
                          padding: EdgeInsets.only(left: 20.h, top: 20.v),
                          child: Text("msg_the_photo_size_for".tr,
                              style: theme.textTheme.titleMedium)),
                      Padding(
                          padding: EdgeInsets.only(left: 20.h, top: 19.v),
                          child: Text("lbl_prompt".tr,
                              style: theme.textTheme.bodyLarge)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 374.h,
                              margin: EdgeInsets.only(
                                  left: 20.h, top: 8.v, right: 20.h),
                              child: Text("msg_however_you_can2".tr,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyLargeGray700
                                      .copyWith(height: 1.50)))),
                      Padding(
                          padding: EdgeInsets.only(left: 20.h, top: 16.v),
                          child: Text("lbl_prompt".tr,
                              style: theme.textTheme.bodyLarge)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 368.h,
                              margin: EdgeInsets.only(
                                  left: 20.h, top: 8.v, right: 25.h),
                              child: Text("msg_as_of_june_1_google".tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyLargeGray700
                                      .copyWith(height: 1.50))))
                    ])))));
  }

  /// Navigates to the artworkPostScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkPostScreen.
  onTapArtworkpost() {
    Get.toNamed(
      AppRoutes.artworkPostScreen,
    );
  }

  /// Navigates to the reportScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the reportScreen.
  onTapReport() {
    Get.toNamed(
      AppRoutes.reportScreen,
    );
  }
}
