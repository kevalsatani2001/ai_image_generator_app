import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'controller/welcome_to_pro_plan_popup_controller.dart';

class WelcomeToProPlanPopupScreen
    extends GetWidget<WelcomeToProPlanPopupController> {
  const WelcomeToProPlanPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.h, vertical: 24.v),
        decoration: AppDecoration.white.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder16),
        child:
        Column(mainAxisSize: MainAxisSize.min, children: [
         CustomImageView(
             svgPath: ImageConstant.imgCrown11Onerrorcontainer,
             height: 100.adaptSize,
             width: 100.adaptSize),
         SizedBox(height: 28.v),
         Text("msg_welcome_to_pro_plan".tr,
             style: theme.textTheme.headlineSmall),
         Container(
             width: 323.h,
             margin: EdgeInsets.only(
                 left: 8.h, top: 16.v, right: 9.h),
             child: Text("msg_you_have_successfully".tr,
                 maxLines: 3,
                 overflow: TextOverflow.ellipsis,
                 textAlign: TextAlign.center,
                 style: theme.textTheme.bodyLarge!
                     .copyWith(height: 1.50))),
         SizedBox(height: 37.v),
         CustomElevatedButton(
             text: "lbl_ok".tr,
             onTap: () {
            Get.back();
            Get.back();
            Get.back();
            Get.back();
             })
        ]));
  }

  /// Navigates to the reviewSummaryScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the reviewSummaryScreen.
  onTapOk() {
    Get.back();
  }
}
