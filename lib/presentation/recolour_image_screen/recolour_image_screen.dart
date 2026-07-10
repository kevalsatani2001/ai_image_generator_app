import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/recolour_image_controller.dart';




class RecolourImageScreen extends StatefulWidget {
  const RecolourImageScreen({super.key});

  @override
  State<RecolourImageScreen> createState() => _RecolourImageScreenState();
}

class _RecolourImageScreenState extends State<RecolourImageScreen> {
 RecolourImageController recolourImageController = Get.put(RecolourImageController());
 final ImagePicker picker = ImagePicker();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: ()async{
    Get.back();
    return true;
   },
      child: Scaffold(
          body: ColorfulSafeArea(
           color: appTheme.whiteA700,
            child: GetBuilder<RecolourImageController>(
              init: RecolourImageController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                  getCommonAppBar("lbl_recolour_image".tr),
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
                                child: Text("msg_upload_your_image".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: CustomTextStyles
                                        .bodyLargeOnPrimaryContainer
                                        .copyWith(height: 1.50)))
                           ]))
                  ])),
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
              onTap: (){
                Get.toNamed(AppRoutes.editSevenScreen);
              }
              ,text: "lbl_recolor".tr))));
 }

 onTapArrowleftone() {
  Get.back();
 }
}






