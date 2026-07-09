import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'controller/password_changed_popup_controller.dart';

class PasswordChangedPopupScreen
    extends GetWidget<PasswordChangedPopupController> {
  const PasswordChangedPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
     onWillPop: ()async {
       return false;
     },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 16.h, vertical: 24.v),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomImageView(
              svgPath: ImageConstant.imgCheckmark,
              height: 98.adaptSize,
              width: 98.adaptSize),
          SizedBox(height: 29.v),
          Text("msg_password_changed".tr,
              style: theme.textTheme.headlineSmall),
          Container(
              width: 335.h,
              margin: EdgeInsets.only(
                  left: 3.h, top: 16.v, right: 3.h),
              child: Text("msg_your_password_has".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(height: 1.50))),
          SizedBox(height: 37.v),
          CustomElevatedButton(
              text: "lbl_ok".tr,
              onTap: () {
                onTapOk();
              })
        ]),
      )



    );
  }


  onTapOk() {
   Get.offAllNamed(AppRoutes.loginScreen);
  }
}
