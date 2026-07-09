import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_image_1.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_title.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/images_to_painting_one_controller.dart';







class ImagesToPaintingOneScreen extends StatefulWidget {
  const ImagesToPaintingOneScreen({super.key});

  @override
  State<ImagesToPaintingOneScreen> createState() => _ImagesToPaintingOneScreenState();
}

class _ImagesToPaintingOneScreenState extends State<ImagesToPaintingOneScreen> {
  ImagesToPaintingOneController imagesToPaintingOneController = Get.put(ImagesToPaintingOneController());
 final ImagePicker picker = ImagePicker();
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
            child: GetBuilder<ImagesToPaintingOneController>(
              init: ImagesToPaintingOneController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                 getCommonAppBar("msg_images_to_painting2".tr),
                    SizedBox(height: 24.v,),
                    controller.images == null
                        ?getImageUploadMethod(() async {
                      XFile? file = await picker.pickImage(
                          source: ImageSource.gallery);
                      controller.images = file!;
                      controller.update();
                    },"lbl_upload_an_image".tr)
                        :
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.h),
                      child: Container(
                          height: 374.v,
                          width: double.infinity,
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
                        child: Text("msg_upload_your_sketch".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles
                                .bodyLargeOnPrimaryContainer
                                .copyWith(height: 1.50)))
                  ])),
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(onTap: (){

                Get.toNamed(AppRoutes.editFourScreen);
              },text: "lbl_generate".tr))));
 }

 onTapArrowleftone() {
  Get.back();
 }
}






