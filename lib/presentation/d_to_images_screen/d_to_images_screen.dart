import 'dart:io';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/d_to_images_controller.dart';





class DToImagesScreen extends StatefulWidget {
  const DToImagesScreen({super.key});

  @override
  State<DToImagesScreen> createState() => _DToImagesScreenState();
}

class _DToImagesScreenState extends State<DToImagesScreen> {
 DToImagesController dToImagesController = Get.put(DToImagesController());
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
            child: GetBuilder<DToImagesController>(
             init: DToImagesController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                  getCommonAppBar("lbl_3d_to_images2".tr),
                   Expanded(
                     child: ListView(
                       children: [
                                 Container(
                           padding: EdgeInsets.symmetric(
                                 horizontal: 0.h, vertical: 24.v),
                           child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                  controller.images == null
                                      ?getImageUploadMethod(() async {
                                   XFile? file = await picker.pickImage(
                                       source: ImageSource.gallery);
                                   controller.images = file!;
                                   controller.update();
                                  },"msg_upload_a_3d_image".tr)
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
                                      margin: EdgeInsets.only(top: 17.v, right: 20.h,left: 20.h,),
                                      child: Text("Upload an image of a simple 3D element, and we'll generate it for you.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyLargeOnPrimaryContainer
                                              .copyWith(height: 1.50))),
                                  SizedBox(height: 26.v),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                    child: Text("lbl_enter_prompt".tr,
                                        style: theme.textTheme.titleMedium),
                                  ),
                                  SizedBox(height: 15.v),
                                   Padding(
                                     padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                     child: CustomTextFormField(
                                       width: double.infinity,
                                         controller: controller.promtController,
                                         hintText: "msg_this_is_where_you_ll".tr,
                                         textInputAction: TextInputAction.done,
                                         maxLines: 3,
                                         contentPadding: EdgeInsets.symmetric(
                                             horizontal: 16.h, vertical: 17.v),
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
          bottomNavigationBar: GetBuilder<DToImagesController>(
            init: DToImagesController(),
            builder:(controller) =>  Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    onTap: dToImagesController.images == null?() {
                      getCustomToast("Please upload image");
                    }:(){
                      Get.toNamed(AppRoutes.editElevenScreen);
                    },
                    text: "lbl_generate".tr)),
          )));
 }

 onTapArrowleftone() {
  Get.back();
 }
}










