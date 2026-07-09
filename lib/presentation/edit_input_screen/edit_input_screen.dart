import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_3.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'controller/edit_input_controller.dart';

// ignore_for_file: must_be_immutable
class EditInputScreen extends GetWidget<EditInputController> {
  EditInputScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 20.v),
                          decoration: AppDecoration.outlineGray,
                          child: CustomAppBar(
                              title: AppbarButton3(
                                  margin: EdgeInsets.only(left: 20.h),
                                  onTap: () {
                                    onTapEditinput();
                                  }))),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 18.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: Text("lbl_edit_input2".tr,
                                        style:
                                            CustomTextStyles.titleMedium16_1)),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 374.h,
                                        margin: EdgeInsets.only(
                                            left: 20.h, top: 15.v, right: 20.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h, vertical: 13.v),
                                        decoration: AppDecoration.fillGray10002
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Container(
                                            width: 334.h,
                                            margin: EdgeInsets.only(
                                                top: 3.v, right: 7.h),
                                            child: Text(
                                                "msg_there_are_many_variations3"
                                                    .tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.bodyLarge!
                                                    .copyWith(height: 1.50))))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.h, top: 26.v),
                                    child: Text("msg_add_negative_prompt".tr,
                                        style:
                                            CustomTextStyles.titleMedium16_1)),
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 374.h,
                                        margin: EdgeInsets.only(
                                            left: 20.h, top: 15.v, right: 20.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h, vertical: 13.v),
                                        decoration: AppDecoration.fillGray10002
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder8),
                                        child: Container(
                                            width: 332.h,
                                            margin: EdgeInsets.only(
                                                top: 3.v, right: 9.h),
                                            child: Text(
                                                "msg_there_are_many_variations4"
                                                    .tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.bodyLarge!
                                                    .copyWith(height: 1.50))))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.h, top: 28.v),
                                    child: Text("lbl_aspect_ratio".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.h, top: 16.v),
                                    child: Row(children: [
                                      Container(
                                          padding: EdgeInsets.all(12.h),
                                          decoration: AppDecoration.blue
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Obx(() => CustomCheckboxButton(
                                              text: "lbl_1_1".tr,
                                              value: controller.eleven.value,
                                              textStyle: CustomTextStyles
                                                  .titleMediumOnErrorContainer16,
                                              onChange: (value) {
                                                controller.eleven.value = value;
                                              }))),
                                      Container(
                                          width: 97.h,
                                          margin: EdgeInsets.only(left: 16.h),
                                          padding: EdgeInsets.all(12.h),
                                          decoration: AppDecoration.fillGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    height: 20.v,
                                                    width: 18.h,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.v),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: appTheme
                                                                .gray700,
                                                            width: 2.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10.h),
                                                    child: Text("lbl_9_16".tr,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ])),
                                      Container(
                                          width: 97.h,
                                          margin: EdgeInsets.only(left: 16.h),
                                          padding: EdgeInsets.all(12.h),
                                          decoration: AppDecoration.fillGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Row(children: [
                                            Container(
                                                height: 18.v,
                                                width: 24.h,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 2.v),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: appTheme.gray700,
                                                        width: 2.h))),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 8.h),
                                                child: Text("lbl_16_9".tr,
                                                    style: theme
                                                        .textTheme.bodyLarge))
                                          ])),
                                      Container(
                                          width: 64.h,
                                          margin: EdgeInsets.only(left: 16.h),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.v),
                                          decoration: AppDecoration.fillGray
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                    height: 24.v,
                                                    width: 22.h,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: appTheme
                                                                .gray700,
                                                            width: 2.h))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.h),
                                                    child: Text("lbl_3_04".tr,
                                                        style: theme.textTheme
                                                            .bodyLarge))
                                              ]))
                                    ])),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.h, top: 26.v),
                                    child: Text("lbl_cfg_scale".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.h, top: 18.v, right: 20.h),
                                    child: SliderTheme(
                                        data: SliderThemeData(
                                            trackShape:
                                                RoundedRectSliderTrackShape(),
                                            activeTrackColor:
                                                theme.colorScheme.primary,
                                            inactiveTrackColor:
                                                appTheme.gray10001,
                                            thumbColor: appTheme.gray100,
                                            thumbShape:
                                                RoundSliderThumbShape()),
                                        child: Slider(
                                            value: 43.85,
                                            min: 0.0,
                                            max: 100.0,
                                            onChanged: (value) {}))),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 20.h, top: 26.v),
                                    child: Text("lbl_seed".tr,
                                        style: theme.textTheme.titleMedium)),
                                CustomTextFormField(
                                    controller:
                                        controller.seedvalueoneController,
                                    margin: EdgeInsets.fromLTRB(
                                        20.h, 18.v, 20.h, 5.v),
                                    hintText: "lbl_123654789654".tr,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.phone,
                                    alignment: Alignment.center,
                                    validator: (value) {
                                      if (!isValidPhone(value)) {
                                        return "Please enter valid phone number";
                                      }
                                      return null;
                                    },
                                    borderDecoration:
                                        TextFormFieldStyleHelper.fillGray,
                                    fillColor: appTheme.gray10002)
                              ]))
                    ]))),
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
                                  text: "lbl_cancel".tr,
                                  margin: EdgeInsets.only(right: 10.h),
                                  onTap: () {
                                    onTapCancel();
                                  })),
                          Expanded(
                              child: CustomElevatedButton(
                                  text: "lbl_save".tr,
                                  margin: EdgeInsets.only(left: 10.h),
                                  onTap: () {
                                    onTapSave();
                                  }))
                        ])))));
  }

  /// Navigates to the editArtworkTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editArtworkTwoScreen.
  onTapCancel() {
    Get.toNamed(
      AppRoutes.editArtworkTwoScreen,
    );
  }

  /// Navigates to the editArtworkTwoScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editArtworkTwoScreen.
  onTapSave() {
    Get.toNamed(
      AppRoutes.editArtworkTwoScreen,
    );
  }

  /// Navigates to the editArtworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editArtworkScreen.
  onTapEditinput() {
    Get.toNamed(
      AppRoutes.editArtworkScreen,
    );
  }
}
