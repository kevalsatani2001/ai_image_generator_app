import 'dart:io';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_form_field.dart';
import '../extend_images_screen/controller/extend_images_controller.dart';
import '../images_to_painting_one_screen/controller/images_to_painting_one_controller.dart';
import 'controller/edit_eight_controller.dart';

class EditEightScreen extends StatefulWidget {
  const EditEightScreen({super.key});

  @override
  State<EditEightScreen> createState() => _EditEightScreenState();
}

class _EditEightScreenState extends State<EditEightScreen> {
 ImagesToPaintingOneController imagesToPaintingOneController = Get.put(ImagesToPaintingOneController());
 EditEightController controller = Get.put(EditEightController());
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
            child: GetBuilder<ExtendImagesController>(
              init: ExtendImagesController(),
              builder: (extendImagesController) => SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                   getCommonAppBar("lbl_edit".tr,actionWidget: AppbarSubtitle(
                       text: "lbl_finalize".tr,
                       onTap: () {
                        onTapFinalize();
                       })),
                   Expanded(
                     child: ListView(
                       children: [
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
                                  SizedBox(height: 28.v),
                                  Text("msg_extend_aspect_ratio".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 16.v),
                                   Padding(
                                     padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                     child: Row(
                                       children: [
                                         Expanded(child: CustomTextFormField(
                                           controller: extendImagesController.imageWidthController,
                                           textInputType: TextInputType.number,
                                           onchange: (value) {
                                             extendImagesController.imageWidth = double.parse(extendImagesController.imageWidthController.text);
                                             extendImagesController.update();
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
                                             extendImagesController.imageHeight = double.parse(extendImagesController.imageHeightController.text);
                                             extendImagesController.update();
                                           },
                                           controller: extendImagesController.imageHeightController,
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
                   )
                  ])),
            ),
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
                           width: 173.h, text: "lbl_generate".tr),
                       CustomElevatedButton(
                         onTap: (){
                           getDownloadDialogue(context,(){});
                         },
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.extendImagesOneScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeSevenScreen,
  );
 }
}






