import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/extend_images_controller.dart';





class ExtendImagesScreen extends StatefulWidget {
  const ExtendImagesScreen({super.key});

  @override
  State<ExtendImagesScreen> createState() => _ExtendImagesScreenState();
}

class _ExtendImagesScreenState extends State<ExtendImagesScreen> {
 ExtendImagesController extendImagesController = Get.put(ExtendImagesController());
 final ImagePicker picker = ImagePicker();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  extendImagesController.imageHeightController.text = extendImagesController.imageHeight.toString();
  extendImagesController.imageWidthController.text = extendImagesController.imageWidth.toString();
  return WillPopScope(
   onWillPop: () async{
    Get.back();
     return true;
   },
      child: Scaffold(
          body: ColorfulSafeArea(
           color: appTheme.whiteA700,
            child: GetBuilder<ExtendImagesController>(
              init: ExtendImagesController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_extend_images2".tr,),

                    Expanded(
                      child: ListView(
                        children: [
                                  Container(
                            padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 24.v),
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child:   controller.images == null
                                          ?getImageUploadMethod(() async {
                                        XFile? file = await picker.pickImage(
                                            source: ImageSource.gallery);
                                        controller.images = file!;
                                        controller.update();
                                      },"lbl_upload_an_image".tr)
                                          :
                                      Container(
                                          height: controller.imageHeight.v,
                                          width: controller.imageWidth.h,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: FileImage(File(controller.images!.path),), fit: BoxFit.cover,),
                                              borderRadius: BorderRadius.circular(8.h)),
                                          child:  CustomIconButton(
                                              onTap: (){

                                                controller.images = null;
                                                controller.update();

                                              },
                                              height: 24.adaptSize,
                                              width: 24.adaptSize,
                                              margin:
                                              EdgeInsets.only(top: 16.v, right: 16.h),
                                              padding: EdgeInsets.all(2.h),
                                              alignment: Alignment.topRight,
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgCloseOnerrorcontainer))
                                      ),
                                    ),





                                    Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(
                                            top: 17.v, right: 20.h, bottom: 5.v,left: 20.h),
                                        child: Text("msg_upload_your_image2".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodyLargeOnPrimaryContainer
                                                .copyWith(height: 1.50))),
                                    SizedBox(height: 28.v),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                                      child: Text("msg_extend_aspect_ratio".tr,
                                          style: theme.textTheme.titleMedium),
                                    ),
                                    SizedBox(height: 16.v),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                      child: Row(
                                        children: [
                                          Expanded(child: CustomTextFormField(
                                            controller: controller.imageWidthController,
                                            textInputType: TextInputType.number,
                                            onchange: (value) {
                                              controller.imageWidth = double.parse(controller.imageWidthController.text);
                                              controller.update();
                                            },
                                            hintText: "Width",
                                            suffix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 16.v, 16.h, 16.v),
                                                child:Text("lbl_px".tr,
                                                    style: theme.textTheme
                                                        .bodyLarge)),
                                          )),
                                          SizedBox(width: 20.h),
                                          Expanded(child: CustomTextFormField(
                                            textInputType: TextInputType.number,
                                            onchange: (value) {
                                              controller.imageHeight = double.parse(controller.imageHeightController.text);
                                              controller.update();
                                            },
                                            controller: controller.imageHeightController,
                                            hintText: "Height",
                                            suffix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 16.v, 16.h, 16.v),
                                                child:Text("lbl_px".tr,
                                                    style: theme.textTheme
                                                        .bodyLarge)),
                                          )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.v)
                                  ])),
                                ],
                      ),
                    ),



                  ])),
            ),
          ),
          bottomNavigationBar: GetBuilder<ExtendImagesController>(
            init: ExtendImagesController(),
            builder:(controller) =>  Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    
                    onTap: controller.images == null?(){
                      getCustomToast("Please upload image");
                    }:(){
                      Get.toNamed(AppRoutes.editEightScreen);
                    },
                    text: "lbl_extend".tr)),
          )));
 }


 onTapArrowleftone() {
  Get.back();
 }
}



