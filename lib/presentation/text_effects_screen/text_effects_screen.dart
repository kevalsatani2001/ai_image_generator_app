import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../text_effects_one_screen/controller/text_effects_one_controller.dart';


class TextEffectsScreen extends StatefulWidget {
  const TextEffectsScreen({super.key});

  @override
  State<TextEffectsScreen> createState() => _TextEffectsScreenState();
}

class _TextEffectsScreenState extends State<TextEffectsScreen> {
  TextEffectsOneController textEffectsOneController = Get.put(TextEffectsOneController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () async{
          Get.back();
          return true;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ColorfulSafeArea(
              color: appTheme.white,
              child: GetBuilder<TextEffectsOneController>(
                init: TextEffectsOneController(),
                builder:(controller) =>  SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("Text effects"),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 24.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextFormField(
                                    controller: controller.textEffectController,
                                    borderDecoration:  OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.h),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    fillColor: appTheme.lightGray,
                                    textalign: TextAlign.center,
                                    hintText: "lbl_your_text".tr,
                                    hintStyle:  CustomTextStyles
                                        .headlineSmallBluegray100,
                                    textStyle: CustomTextStyles.headlineSmallBlack,
                                    contentPadding: EdgeInsets.symmetric(vertical: 60.v)),
                                SizedBox(height: 26.v),
                                Text("msg_describe_text_effects".tr,
                                    style: CustomTextStyles
                                        .titleMediumOnPrimaryContainer_1),
                                SizedBox(height: 18.v),
                                CustomTextFormField(
                                    controller: controller.freeupspaceoneController,
                                    hintText: "msg_however_you_can".tr,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 5,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.h, vertical: 17.v),
                                    borderDecoration:
                                    TextFormFieldStyleHelper.fillGray,
                                    fillColor: appTheme.gray10002),
                                SizedBox(height: 5.v)
                              ]))
                    ])),
              ),
            ),
            bottomNavigationBar: GetBuilder<TextEffectsOneController>(
              init: TextEffectsOneController(),
                builder:(controller) =>  Container(
                  margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                  decoration: AppDecoration.white,
                  child: CustomElevatedButton(
                      text: "lbl_generate".tr,
                      onTap: controller.textEffectController.text.isEmpty?(){
                        getCustomToast("Please Enter your text");

                      }:() {
                        controller.currentText = controller.textEffectController.text;
                        controller.update();
                        Get.toNamed(
                          AppRoutes.editScreen,
                        );
                      })),
            )));
  }



  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editScreen,
    );
  }


  onTapTexteffects() {
    Get.toNamed(
      AppRoutes.textEffectsOneScreen,
    );
  }
}


