import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../extend_images_screen/controller/extend_images_controller.dart';
import 'controller/finalize_seven_controller.dart';




class FinalizeSevenScreen extends StatefulWidget {
  const FinalizeSevenScreen({super.key});

  @override
  State<FinalizeSevenScreen> createState() => _FinalizeSevenScreenState();
}

class _FinalizeSevenScreenState extends State<FinalizeSevenScreen> {
 FinalizeSevenController controller = Get.put(FinalizeSevenController());
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
          body: GetBuilder<ExtendImagesController>(
            init: ExtendImagesController(),
            builder:(extendImagesController) =>  SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                getCommonAppBar("lbl_finalize".tr),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 24.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Center(
                             child: Container(
                                 height: extendImagesController.imageHeight.v,
                                 width: extendImagesController.imageWidth.h,
                                 decoration:BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                                     image: DecorationImage(image: FileImage(File(extendImagesController.images!.path),),fit: BoxFit.cover))
                             ),
                           ),
                          SizedBox(height: 26.v),
                          Text("lbl_add_title".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 18.v),
                          CustomTextFormField(
                              controller: controller.sunsetimageController,
                              hintText: "lbl_sunset_image".tr,
                              textInputAction: TextInputAction.done),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       CustomOutlinedButton(
                           width: 173.h, text: "lbl_share".tr),
                       CustomElevatedButton(
                         onTap: () {
                           getDownloadDialogue(context, (){});
                         },
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.editEightScreen,
  );
 }
}





