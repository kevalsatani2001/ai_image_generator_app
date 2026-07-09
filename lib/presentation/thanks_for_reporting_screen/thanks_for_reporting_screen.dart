import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'controller/thanks_for_reporting_controller.dart';

class ThanksForReportingScreen extends GetWidget<ThanksForReportingController> {
  const ThanksForReportingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 24.v,horizontal: 16.h),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           CustomImageView(
               svgPath: ImageConstant.imgCheckmark,
               height: 98.adaptSize,
               width: 98.adaptSize),
           SizedBox(height: 29.v),
           Text("msg_thanks_for_reporting".tr,
               style:
               theme.textTheme.headlineSmall),
           Container(
               width: 333.h,
               margin: EdgeInsets.only(
                   left: 3.h,
                   top: 16.v,
                   right: 4.h),
               child: Text(
                   "msg_we_will_review_your".tr,
                   maxLines: 2,
                   overflow: TextOverflow.ellipsis,
                   textAlign: TextAlign.center,
                   style: theme
                       .textTheme.bodyLarge!
                       .copyWith(height: 1.50))),
           SizedBox(height: 37.v),
           CustomElevatedButton(
               text: "lbl_ok".tr,
               onTap: () {
                onTapOk();
               })
          ]),
    );
  }

  /// Navigates to the reportScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the reportScreen.
  onTapOk() {
    Get.back();
  }
}
