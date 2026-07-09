import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_created_page/profile_created_page.dart';
import 'package:ai_image_generator/presentation/profile_liked_page/profile_liked_page.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import 'controller/more_popup_tab_container_controller.dart';

class MorePopupTabContainerScreen
    extends GetWidget<MorePopupTabContainerController> {
  const MorePopupTabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 17.v),
                      decoration: AppDecoration.outlineGray10001,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.v),
                            CustomElevatedButton(
                                height: 33.v,
                                width: 119.h,
                                text: "lbl_profile".tr,
                                leftIcon: Container(
                                    margin: EdgeInsets.only(right: 16.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft)),
                                buttonStyle: CustomButtonStyles.none,
                                buttonTextStyle: theme.textTheme.headlineSmall!)
                          ])),
                  SizedBox(height: 16.v),
                  SizedBox(
                      height: 405.v,
                      width: 374.h,
                      child: Stack(alignment: Alignment.bottomLeft, children: [
                        Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                                height: 394.v,
                                width: 374.h,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 262.v, bottom: 44.v),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 8.h),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        26.h,
                                                                    vertical:
                                                                        17.v),
                                                            decoration: AppDecoration
                                                                .fillGray10002
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder8),
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                      "lbl_674"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .titleMedium16_1),
                                                                  SizedBox(
                                                                      height:
                                                                          9.v),
                                                                  Text(
                                                                      "lbl_artwork"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyLarge)
                                                                ]))),
                                                    Expanded(
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        8.h),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.h,
                                                                    vertical:
                                                                        17.v),
                                                            decoration: AppDecoration
                                                                .fillGray10002
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder8),
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                      "lbl_254_k"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .titleMedium16_1),
                                                                  SizedBox(
                                                                      height:
                                                                          9.v),
                                                                  Text(
                                                                      "lbl_followers"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyLarge)
                                                                ]))),
                                                    Expanded(
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8.h),
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        21.h,
                                                                    vertical:
                                                                        15.v),
                                                            decoration: AppDecoration
                                                                .fillGray10002
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder8),
                                                            child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          2.v),
                                                                  Text(
                                                                      "lbl_1258"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .titleMedium16_1),
                                                                  SizedBox(
                                                                      height:
                                                                          11.v),
                                                                  Text(
                                                                      "lbl_following"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .bodyLarge)
                                                                ])))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.topCenter,
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgEllipse237104x104,
                                                    height: 104.adaptSize,
                                                    width: 104.adaptSize,
                                                    radius:
                                                        BorderRadius.circular(
                                                            52.h)),
                                                SizedBox(height: 20.v),
                                                Text("lbl_aida_bugg".tr,
                                                    style: theme
                                                        .textTheme.titleMedium),
                                                SizedBox(height: 3.v),
                                                Text("lbl_aida_bugg2".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray700),
                                                SizedBox(height: 23.v),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      133.h,
                                                                  vertical:
                                                                      9.v),
                                                          decoration: AppDecoration
                                                              .blue
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder8),
                                                          child: Text(
                                                              "lbl_follow".tr,
                                                              style: CustomTextStyles
                                                                  .titleMediumOnErrorContainerSemiBold)),
                                                      CustomIconButton(
                                                          height: 40.adaptSize,
                                                          width: 40.adaptSize,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 16.h),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.h),
                                                          decoration:
                                                              IconButtonStyleHelper
                                                                  .fillGrayTL82,
                                                          child: CustomImageView(
                                                              svgPath: ImageConstant
                                                                  .imgOverflowmenu))
                                                    ])
                                              ])),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                              margin:
                                                  EdgeInsets.only(right: 16.h),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.h,
                                                  vertical: 15.v),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder16),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(children: [
                                                      CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgCopy1,
                                                          height: 24.adaptSize,
                                                          width: 24.adaptSize),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 12.h,
                                                                  top: 2.v),
                                                          child: Text(
                                                              "msg_copy_profile_url"
                                                                  .tr,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodyLarge))
                                                    ]),
                                                    SizedBox(height: 16.v),
                                                    CustomElevatedButton(
                                                        height: 24.v,
                                                        width: 150.h,
                                                        text: "lbl_show_qr_code"
                                                            .tr,
                                                        leftIcon: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        16.h),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgDownload)),
                                                        buttonStyle:
                                                            CustomButtonStyles
                                                                .none,
                                                        buttonTextStyle: theme
                                                            .textTheme
                                                            .bodyLarge!,
                                                        onTap: () {
                                                          onTapShowqrcode();
                                                        }),
                                                    SizedBox(height: 16.v),
                                                    CustomElevatedButton(
                                                        height: 24.v,
                                                        width: 170.h,
                                                        text:
                                                            "msg_share_this_profile"
                                                                .tr,
                                                        leftIcon: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        16.h),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
                                                                        .imgSend)),
                                                        buttonStyle:
                                                            CustomButtonStyles
                                                                .none,
                                                        buttonTextStyle: theme
                                                            .textTheme
                                                            .bodyLarge!,
                                                        onTap: () {
                                                          onTapSharethis();
                                                        }),
                                                    SizedBox(height: 16.v),
                                                    CustomElevatedButton(
                                                        height: 25.v,
                                                        width: 92.h,
                                                        text: "lbl_report".tr,
                                                        leftIcon: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        16.h),
                                                            child: CustomImageView(
                                                                svgPath:
                                                                    ImageConstant
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
                                    ]))),
                        SizedBox(
                            height: 30.v,
                            width: 136.h,
                            child: TabBar(
                                controller: controller.tabviewController,
                                labelPadding: EdgeInsets.zero,
                                labelColor: theme.colorScheme.primary,
                                labelStyle: TextStyle(
                                    fontSize: 16.fSize,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700),
                                unselectedLabelColor: appTheme.gray700,
                                unselectedLabelStyle: TextStyle(
                                    fontSize: 16.fSize,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w400),
                                indicatorColor: theme.colorScheme.primary,
                                tabs: [
                                  Tab(child: Text("lbl_created".tr)),
                                  Tab(child: Text("lbl_liked".tr))
                                ]))
                      ])),
                  SizedBox(
                      height: 357.v,
                      child: TabBarView(
                          controller: controller.tabviewController,
                          children: [ProfileCreatedPage(), ProfileLikedPage()]))
                ])))));
  }

  /// Navigates to the showQrCodeScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the showQrCodeScreen.
  onTapShowqrcode() {
    Get.toNamed(
      AppRoutes.showQrCodeScreen,
    );
  }

  /// Navigates to the shareThisProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the shareThisProfileScreen.
  onTapSharethis() {
    Get.toNamed(
      AppRoutes.shareThisProfileScreen,
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
