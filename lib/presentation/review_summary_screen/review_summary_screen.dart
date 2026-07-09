import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/welcome_to_pro_plan_popup_screen/welcome_to_pro_plan_popup_screen.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_9.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import 'controller/review_summary_controller.dart';

class ReviewSummaryScreen extends GetWidget<ReviewSummaryController> {
  const ReviewSummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                 getCommonAppBar("Review summary"),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.all(16.h),
                                decoration: AppDecoration.fillGray10002
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(top: 1.v),
                                                child: Text(
                                                    "lbl_subscription".tr,
                                                    style: CustomTextStyles
                                                        .bodyLargeGray700)),
                                            Text("lbl_6_month".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]),
                                      SizedBox(height: 16.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_price".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeGray700),
                                            Text("lbl_14_00".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ])
                                    ])),
                            SizedBox(height: 16.v),
                            Container(
                                padding: EdgeInsets.all(16.h),
                                decoration: AppDecoration.fillGray10002
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_amount".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeGray700),
                                            Text("lbl_24_00".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]),
                                      SizedBox(height: 17.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_tax".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeGray700),
                                            Text("lbl_1_00".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]),
                                      SizedBox(height: 16.v),
                                      Divider(color: appTheme.blueGray100),
                                      SizedBox(height: 17.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("lbl_total_amout".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeGray700),
                                            Text("lbl_25_00".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ])
                                    ])),
                            SizedBox(height: 28.v),
                            Text("lbl_payment_method".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 16.v),
                            Container(
                                padding: EdgeInsets.all(12.h),
                                decoration: AppDecoration.fillGray10002
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomIconButton(
                                          height: 60.adaptSize,
                                          width: 60.adaptSize,
                                          margin: EdgeInsets.only(left: 4.h),
                                          padding: EdgeInsets.all(12.h),
                                          decoration: IconButtonStyleHelper
                                              .fillOnErrorContainerTL30,
                                          child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgGooglepay1)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 19.v,
                                              bottom: 15.v),
                                          child: Text("lbl_google_pay".tr,
                                              style: CustomTextStyles
                                                  .titleMediumSemiBold)),
                                      Spacer(),
                                      CustomOutlinedButton(
                                          height: 32.v,
                                          width: 95.h,
                                          text: "lbl_change".tr,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 14.v),
                                          buttonTextStyle: CustomTextStyles
                                              .bodyMediumPrimary)
                                    ])),
                            SizedBox(height: 5.v)
                          ]))
                ])),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    text: "msg_continue_payment".tr,
                    onTap: () {
                     showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                       return AlertDialog(
                           insetPadding: EdgeInsets.all(16),
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(20)),
                           contentPadding: EdgeInsets.zero,
                           content: WelcomeToProPlanPopupScreen());
                      },
                     );
                    }))));
  }

  /// Navigates to the welcomeToProPlanPopupScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the welcomeToProPlanPopupScreen.
  onTapContinue() {



    Get.toNamed(
      AppRoutes.welcomeToProPlanPopupScreen,
    );
  }

  /// Navigates to the selectPaymentScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the selectPaymentScreen.
  onTapReviewsummary() {
    Get.toNamed(
      AppRoutes.selectPaymentScreen,
    );
  }
}
