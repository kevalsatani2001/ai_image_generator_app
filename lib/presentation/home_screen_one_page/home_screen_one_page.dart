import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_circleimage.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_image.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../home_screen_one_page/widgets/listview_item_widget.dart';
import 'controller/home_screen_one_controller.dart';
import 'models/home_screen_one_model.dart';
import 'models/listview_item_model.dart';

// ignore_for_file: must_be_immutable
class HomeScreenOnePage extends StatelessWidget {
  HomeScreenOnePage({Key? key}) : super(key: key);

  HomeScreenOneController controller =
      Get.put(HomeScreenOneController(HomeScreenOneModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: 70.v,
                leadingWidth: 64.h,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imgEllipse249,
                    margin: EdgeInsets.only(left: 20.h, top: 5.v, bottom: 6.v)),
                title: Container(
                    width: 124.h,
                    margin: EdgeInsets.only(left: 14.h),
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "lbl_welcome".tr,
                              style: theme.textTheme.titleLarge),
                          TextSpan(
                              text: " \n".tr,
                              style: CustomTextStyles.bodyLargeGray700_1),
                          TextSpan(
                              text: "lbl_john_abram".tr,
                              style: CustomTextStyles.bodyMediumGray700_1)
                        ]),
                        textAlign: TextAlign.left)),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgIcnotificatuion,
                      margin: EdgeInsets.fromLTRB(20.h, 15.v, 20.h, 16.v),
                      onTap: () {
                        onTapIcnotificatuion();
                      })
                ]),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 26.v),
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.h, bottom: 5.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(right: 20.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_enter_prompt".tr,
                                            style: theme.textTheme.titleMedium),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 2.v),
                                            child: Text("lbl_explore".tr,
                                                style: CustomTextStyles
                                                    .titleMediumPrimarySemiBold))
                                      ])),
                              CustomTextFormField(
                                  controller: controller.typeanythingController,
                                  margin:
                                      EdgeInsets.only(top: 15.v, right: 20.h),
                                  hintText: "lbl_type_anything".tr,
                                  textInputAction: TextInputAction.done,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.h, vertical: 33.v),
                                  borderDecoration: TextFormFieldStyleHelper
                                      .outlineBlueGrayTL8,
                                  filled: false),
                              SizedBox(height: 28.v),
                              Text("lbl_aspect_ratio".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(
                                  height: 64.v,
                                  child: Obx(() => ListView.separated(
                                      padding: EdgeInsets.only(
                                          top: 16.v, right: 80.h),
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) {
                                        return SizedBox(width: 16.h);
                                      },
                                      itemCount: controller
                                          .homeScreenOneModelObj
                                          .value
                                          .listviewItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        ListviewItemModel model = controller
                                            .homeScreenOneModelObj
                                            .value
                                            .listviewItemList
                                            .value[index];
                                        return ListviewItemWidget(model);
                                      }))),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 28.v, right: 20.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_art_style".tr,
                                            style: theme.textTheme.titleMedium),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtViewall();
                                            },
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4.v),
                                                child: Text("lbl_view_all".tr,
                                                    style: CustomTextStyles
                                                        .bodyMediumGray700)))
                                      ])),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 16.v, right: 20.h),
                                  child: Row(children: [
                                    Container(
                                        decoration: AppDecoration.fillGray10002
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgIllustrationha,
                                                  height: 173.v,
                                                  width: 177.h,
                                                  radius: BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          8.h))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.h,
                                                      top: 8.v,
                                                      bottom: 9.v),
                                                  child: Text(
                                                      "lbl_the_colourfull".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge))
                                            ])),
                                    Container(
                                        margin: EdgeInsets.only(left: 20.h),
                                        decoration: AppDecoration.fillGray10002
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgIllustrationha173x177,
                                                  height: 173.v,
                                                  width: 177.h,
                                                  radius: BorderRadius.vertical(
                                                      top: Radius.circular(
                                                          8.h))),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.h,
                                                      top: 11.v,
                                                      bottom: 6.v),
                                                  child: Text("lbl_painting".tr,
                                                      style: theme
                                                          .textTheme.bodyLarge))
                                            ]))
                                  ])),
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 28.v, right: 20.h),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_input_images".tr,
                                            style: theme.textTheme.titleMedium),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 4.v),
                                            child: Text("lbl_view_all".tr,
                                                style: CustomTextStyles
                                                    .bodyMediumGray700))
                                      ])),
                              SizedBox(height: 16.v),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: IntrinsicWidth(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 17.h,
                                                vertical: 56.v),
                                            decoration: AppDecoration
                                                .outlineBlueGray
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomIconButton(
                                                      height: 32.adaptSize,
                                                      width: 32.adaptSize,
                                                      padding:
                                                          EdgeInsets.all(4.h),
                                                      decoration:
                                                          IconButtonStyleHelper
                                                              .fillGray,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgPlus)),
                                                  SizedBox(height: 10.v),
                                                  Text("lbl_upload".tr,
                                                      style: CustomTextStyles
                                                          .bodyMediumPrimary)
                                                ])),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIllustrationha177x177,
                                            height: 177.adaptSize,
                                            width: 177.adaptSize,
                                            radius: BorderRadius.circular(8.h)),
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgIllustrationha1,
                                            height: 177.adaptSize,
                                            width: 177.adaptSize,
                                            radius: BorderRadius.circular(15.h))
                                      ]))),
                              CustomElevatedButton(
                                  text: "lbl_generate".tr,
                                  margin:
                                      EdgeInsets.only(top: 24.v, right: 20.h),
                                  buttonStyle: CustomButtonStyles.fillGray,
                                  buttonTextStyle:
                                      CustomTextStyles.titleMediumSemiBold,
                                  onTap: () {
                                    onTapGenerate();
                                  })
                            ]))))));
  }

  /// Navigates to the notificationsScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the notificationsScreen.
  onTapIcnotificatuion() {
    Get.toNamed(
      AppRoutes.notificationsScreen,
    );
  }

  /// Navigates to the artStylesScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the artStylesScreen.
  onTapTxtViewall() {
    Get.toNamed(
      AppRoutes.artStylesScreen,
    );
  }

  /// Navigates to the homeScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the homeScreen.
  onTapGenerate() {
    Get.toNamed(
      AppRoutes.homeScreen,
    );
  }
}
