import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_image_1.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_title.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/controlnet_one_controller.dart';



class ControlnetOneScreen extends StatefulWidget {
  const ControlnetOneScreen({super.key});

  @override
  State<ControlnetOneScreen> createState() => _ControlnetOneScreenState();
}

class _ControlnetOneScreenState extends State<ControlnetOneScreen> {
 ControlnetOneController controlnetOneController = Get.put(ControlnetOneController());
 final ImagePicker picker = ImagePicker();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: GetBuilder<ControlnetOneController>(
            init: ControlnetOneController(),
            builder:(controller) =>  SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                 Container(
                     padding: EdgeInsets.symmetric(vertical: 17.v),
                     decoration: AppDecoration.outlineGray,
                     child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 6.v),
                      CustomAppBar(
                          leadingWidth: 44.h,
                          leading: AppbarImage1(
                              svgPath: ImageConstant.imgArrowleft,
                              margin: EdgeInsets.only(
                                  left: 20.h, top: 4.v, bottom: 4.v),
                              onTap: () {
                               onTapArrowleftone();
                              }),
                          title: AppbarTitle(
                              text: "lbl_controlnet".tr,
                              margin: EdgeInsets.only(left: 16.h)))
                     ])),
                 Container(
                     padding: EdgeInsets.symmetric(
                       vertical: 24.v),
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
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 20.v),
                             child: Container(
                                 height: 374.v,
                                 width:double.infinity,
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
                          ),
                          Container(
                              width:double.infinity,
                              margin: EdgeInsets.only(top: 17.v, right: 20.h,left: 20.h),
                              child: Text("msg_upload_models_stickman".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .bodyLargeOnPrimaryContainer
                                      .copyWith(height: 1.50))),
                          SizedBox(height: 26.v),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
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
                         ]))
                ])),
          ),
          bottomNavigationBar: GetBuilder<ControlnetOneController>(
            init: ControlnetOneController(),
            builder:(controller) =>  Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    onTap:controller.images == null?(){
                      getCustomToast("Please upload image");
                    }: () {
                      Get.toNamed(AppRoutes.editFiveScreen);
                    },
                    text: "lbl_generate".tr)),
          )));
 }

 onTapArrowleftone() {
  Get.back();
 }
}


