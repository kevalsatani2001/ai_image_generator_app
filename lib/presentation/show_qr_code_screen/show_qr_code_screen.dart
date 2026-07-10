import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'controller/show_qr_code_controller.dart';

class ShowQrCodeScreen extends GetWidget<ShowQrCodeController> {
  const ShowQrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
     onWillPop: () async{
      Get.back();
       return true;
     },
        child: Scaffold(
            body: ColorfulSafeArea(
             color: appTheme.whiteA700,
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_show_qr_code".tr),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 40.v),
                        child: Column(children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgGroupBlack900,
                              height: 178.adaptSize,
                              width: 178.adaptSize),
                          SizedBox(height: 50.v),
                          Text("msg_people_can_scan".tr,
                              style: theme.textTheme.bodyLarge),
                          SizedBox(height: 5.v)
                        ]))
                  ])),
            ),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: Container(
                    decoration: AppDecoration.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CustomOutlinedButton(
                                  text: "lbl_share".tr,
                                  margin: EdgeInsets.only(right: 10.h),
                                  onTap: ()async{
                                   await Share.share('Hello Welcome to FlutterCampus', subject: 'Welcome Message');
                                  })),
                          Expanded(
                              child: CustomElevatedButton(
                               onTap: (){
                                Get.back();
                               },
                                  text: "lbl_save".tr,
                                  margin: EdgeInsets.only(left: 10.h)))
                        ])))));
  }

  /// Navigates to the shareThisProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the shareThisProfileScreen.
  onTapShare() {
    Get.toNamed(
      AppRoutes.shareThisProfileScreen,
    );
  }

  /// Navigates to the morePopupTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the morePopupTabContainerScreen.
  onTapShowqrcode() {
    Get.toNamed(
      AppRoutes.morePopupTabContainerScreen,
    );
  }
}
