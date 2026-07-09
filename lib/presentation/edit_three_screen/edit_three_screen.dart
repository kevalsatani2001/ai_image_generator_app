import 'controller/edit_three_controller.dart';import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/widgets/app_bar/appbar_button_4.dart';import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';import 'package:ai_image_generator/widgets/custom_elevated_button.dart';import 'package:ai_image_generator/widgets/custom_outlined_button.dart';import 'package:flutter/material.dart';class EditThreeScreen extends GetWidget<EditThreeController> {const EditThreeScreen({Key? key}) : super(key: key);

@override Widget build(BuildContext context) { mediaQueryData = MediaQuery.of(context); return SafeArea(child: Scaffold(body: SizedBox(width: double.maxFinite, child: Column(children: [Container(padding: EdgeInsets.symmetric(vertical: 17.v), decoration: AppDecoration.outlineGray, child: Column(mainAxisSize: MainAxisSize.min, children: [SizedBox(height: 6.v), CustomAppBar(title: AppbarButton4(margin: EdgeInsets.only(left: 20.h), onTap: () {onTapEdit();}), actions: [AppbarSubtitle(text: "lbl_finalize".tr, margin: EdgeInsets.fromLTRB(20.h, 4.v, 20.h, 3.v), onTap: () {onTapFinalize();})])])), SizedBox(height: 24.v), CustomImageView(imagePath: ImageConstant.imgIllustrationha244x244, height: 374.adaptSize, width: 374.adaptSize, radius: BorderRadius.circular(8.h)), Spacer()])), bottomNavigationBar: Container(margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v), decoration: AppDecoration.white, child: Container(decoration: AppDecoration.white, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [CustomOutlinedButton(width: 173.h, text: "lbl_share".tr), CustomElevatedButton(width: 177.h, text: "lbl_download".tr)]))))); } 
/// Navigates to the batchArtGeneratorScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the batchArtGeneratorScreen.
onTapEdit() { Get.toNamed(AppRoutes.batchArtGeneratorScreen, ); } 
/// Navigates to the finalizeNineScreen when the action is triggered.

/// When the action is triggered, this function uses the [Get] package to
/// push the named route for the finalizeNineScreen.
onTapFinalize() { Get.toNamed(AppRoutes.finalizeNineScreen, ); } 
 }
