import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/custom_bottom_bar.dart';
import 'controller/log_out_popup_controller.dart';

class LogOutPopupScreen extends GetWidget<LogOutPopupController> {
  const LogOutPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder:(controller) =>  Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 0.h),
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.h, vertical: 24.v),
              decoration: AppDecoration.white.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16),
              child:
              Column(mainAxisSize: MainAxisSize.min, children: [
                Text("lbl_logout".tr,
                    style: theme.textTheme.headlineSmall),
                SizedBox(height: 18.v),
                SizedBox(
                    width: double.infinity,
                    child: Text("Are you sure you want to log out?".tr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(height: 1.50))),
                SizedBox(height: 37.v),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: CustomOutlinedButton(
                              text: "lbl_cancel".tr,
                              margin: EdgeInsets.only(right: 10.h),
                              onTap: () {
                                Get.back();
                              })),
                      Expanded(
                          child: CustomElevatedButton(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                await PrefUtils.setIsSignIn(true);
                                Get.offAllNamed(AppRoutes.loginScreen);
                                controller.getIndex(0);
                              },
                              text: "lbl_logout".tr,
                              margin: EdgeInsets.only(left: 10.h)))
                    ])
              ]))),
    );

  }

  /// Navigates to the settingsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the settingsScreen.
  onTapCancel() {
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}
