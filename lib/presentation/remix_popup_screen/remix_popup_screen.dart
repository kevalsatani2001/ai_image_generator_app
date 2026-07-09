import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

import 'controller/remix_popup_controller.dart';

class RemixPopupScreen extends GetWidget<RemixPopupController> {
  const RemixPopupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 16.v),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Row(
               mainAxisAlignment:
               MainAxisAlignment.spaceBetween,
               children: [
                Text("lbl_remix".tr,
                    style:
                    theme.textTheme.titleMedium),
                CustomImageView(
                    svgPath: ImageConstant.imgClose,
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    onTap: () {
                     onTapImgCloseone();
                    })
               ]),
           SizedBox(height: 26.v),
           Row(children: [
            CustomImageView(
                svgPath: ImageConstant.imgSignal,
                height: 24.adaptSize,
                width: 24.adaptSize,
                margin: EdgeInsets.only(bottom: 1.v)),
            Padding(
                padding:
                EdgeInsets.only(left: 12.h, top: 3.v),
                child: Text("msg_use_as_input_image".tr,
                    style: theme.textTheme.bodyLarge))
           ]),
           SizedBox(height: 22.v),
           Row(children: [
            CustomImageView(
                svgPath: ImageConstant.imgCallBlack900,
                height: 24.adaptSize,
                width: 24.adaptSize),
            Padding(
                padding:
                EdgeInsets.only(left: 16.h, top: 2.v),
                child: Text("msg_create_art_with".tr,
                    style: theme.textTheme.bodyLarge))
           ]),
           SizedBox(height: 23.v),
           Row(children: [
            CustomImageView(
                svgPath: ImageConstant.imgEdit,
                height: 24.adaptSize,
                width: 24.adaptSize),
            Padding(
                padding:
                EdgeInsets.only(left: 16.h, top: 2.v),
                child: Text("lbl_try_this_style".tr,
                    style: theme.textTheme.bodyLarge))
           ]),
           SizedBox(height: 12.v)
          ]),
    );
  }

  /// Navigates to the artworkPostScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artworkPostScreen.
  onTapImgCloseone() {
    Get.back();

  }
}
