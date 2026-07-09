import 'controller/recolour_image_one_controller.dart';import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/widgets/app_bar/appbar_button_2.dart';import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';import 'package:ai_image_generator/widgets/custom_elevated_button.dart';import 'package:ai_image_generator/widgets/custom_icon_button.dart';import 'package:flutter/material.dart';class RecolourImageOneScreen extends GetWidget<RecolourImageOneController> {const RecolourImageOneScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: SizedBox(width: double.maxFinite, child: Column(children: [Container(padding: EdgeInsets.symmetric(vertical: 20.v), decoration: AppDecoration.outlineGray, child: CustomAppBar(title: AppbarButton2(margin: EdgeInsets.only(left: 20.h), onTap: () {onTapRecolourimage();}))), Container(padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 24.v), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 374.adaptSize, width: 374.adaptSize, child: Stack(alignment: Alignment.topRight, children: [CustomImageView(imagePath: ImageConstant.imgRectangle7646, height: 374.adaptSize, width: 374.adaptSize, radius: BorderRadius.circular(8.h), alignment: Alignment.center), CustomIconButton(height: 24.adaptSize, width: 24.adaptSize, margin: EdgeInsets.only(top: 16.v, right: 16.h), padding: EdgeInsets.all(2.h), alignment: Alignment.topRight, child: CustomImageView(svgPath: ImageConstant.imgCloseOnerrorcontainer))])), Container(width: 333.h, margin: EdgeInsets.only(top: 17.v, right: 40.h, bottom: 5.v), child: Text("msg_upload_your_image".tr, maxLines: 2, overflow: TextOverflow.ellipsis, style: CustomTextStyles.bodyLargeOnPrimaryContainer.copyWith(height: 1.50)))]))])), bottomNavigationBar: Container(margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v), decoration: AppDecoration.white, child: CustomElevatedButton(text: "lbl_recolor".tr, onTap: () {onTapRecolor();})))); } 
/// Navigates to the editSevenScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the editSevenScreen.
onTapRecolor() { Get.toNamed(AppRoutes.editSevenScreen, ); } 
/// Navigates to the recolourImageScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the recolourImageScreen.
onTapRecolourimage() { Get.toNamed(AppRoutes.recolourImageScreen, ); } 
 }
