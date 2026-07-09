import 'dart:io';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/sketch_to_images_three_controller.dart';



class SketchToImagesThreeScreen extends StatefulWidget {
  const SketchToImagesThreeScreen({super.key});

  @override
  State<SketchToImagesThreeScreen> createState() => _SketchToImagesThreeScreenState();
}

class _SketchToImagesThreeScreenState extends State<SketchToImagesThreeScreen> {
 SketchToImagesThreeController sketchToImagesThreeController = Get.put(SketchToImagesThreeController());
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
            child: GetBuilder<SketchToImagesThreeController>(
              init: SketchToImagesThreeController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                 getCommonAppBar("msg_sketch_to_images2".tr),

                    controller.images == null
                        ?getImageUploadMethod(() async {
                      XFile? file = await picker.pickImage(
                          source: ImageSource.gallery);
                      controller.images = file!;
                      controller.update();

                    },"Upload a sketch")
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
                            top: 17.v,left: 20.h, right: 20.h, bottom: 5.v),
                        child: Text("msg_upload_your_sketch".tr,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles
                                .bodyLargeOnPrimaryContainer
                                .copyWith(height: 1.50)))
                  ])),
            ),
          ),
          bottomNavigationBar: GetBuilder<SketchToImagesThreeController>(
            init: SketchToImagesThreeController(),
            builder:(controller) =>  Container(
              width: double.infinity,

                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton( onTap:  controller.images == null?(){}:() {
                 Get.toNamed(AppRoutes.editTenScreen);
                },text: "lbl_generate".tr)),
          )));
 }

 onTapArrowleftone() {
  Get.back();
 }
}





