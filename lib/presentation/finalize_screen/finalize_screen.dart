import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/presentation/successful_screen/successful_screen.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_switch.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../art_styles_screen/controller/art_styles_controller.dart';
import '../edit_artwork_screen/controller/edit_artwork_controller.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import 'controller/finalize_controller.dart';



class FinalizeScreen extends StatefulWidget {
  const FinalizeScreen({super.key});

  @override
  State<FinalizeScreen> createState() => _FinalizeScreenState();
}

class _FinalizeScreenState extends State<FinalizeScreen> {
 FinalizeController controller = Get.put(FinalizeController());
 ArtStylesController artStylesController = Get.put(ArtStylesController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: GetBuilder<EditArtworkController>(
            init: EditArtworkController(),
            builder:(editArtworkController) =>  Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                     getCommonAppBar("lbl_finalize".tr),
                     SizedBox(height: 16.v),
                     Expanded(
                         child: SingleChildScrollView(
                             child: Padding(
                                 padding: EdgeInsets.only(
                                     left: 20.h, right: 20.h, bottom: 5.v),
                                 child: Column(
                                     crossAxisAlignment:
                                     CrossAxisAlignment.start,
                                     children: [
                                       editArtworkController.bdata == null?Container(
                                           height: 374.v,
                                           width: double.infinity,
                                           child: Center(child: Container(
                                               height: 50.v,
                                               width: 50.v,
                                               child: CircularProgressIndicator()))):
                                       Center(
                                         child: RepaintBoundary(
                                           key:editArtworkController.globalKey,
                                           child:Container(
                                               height: 374.v,
                                               width: double.infinity,
                                               decoration:BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                                                   image: DecorationImage(image: MemoryImage(editArtworkController.bdata!),fit: BoxFit.cover,
                                                    ))
                                           )
                                         ),

                                       ),
                                      SizedBox(height: 26.v),
                                      Text("lbl_add_title".tr,
                                          style: theme.textTheme.titleMedium),
                                      SizedBox(height: 18.v),
                                      Container(
                                        width: double.infinity,
                                        decoration: AppDecoration.fillGray10002
                                            .copyWith(
                                            borderRadius:
                                            BorderRadiusStyle.roundedBorder8),
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(vertical: 16.v,horizontal: 16.h),
                                          child: Text("msg_in_logical_argument".tr,style:
                                          theme.textTheme.bodyLarge!),
                                        ),
                                      ),
                                      // CustomElevatedButton(
                                      //     text: "msg_in_logical_argument".tr,
                                      //     buttonStyle:
                                      //     CustomButtonStyles.fillGrayTL8,
                                      //     buttonTextStyle:
                                      //     theme.textTheme.bodyLarge!),
                                      SizedBox(height: 24.v),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                           Padding(
                                               padding:
                                               EdgeInsets.only(top: 5.v),
                                               child: Text(
                                                   "lbl_show_prompt".tr,
                                                   style: theme.textTheme
                                                       .titleMedium)),
                                           Obx(() => CustomSwitch(
                                               value: controller
                                                   .isSelectedSwitch.value,
                                               onChange: (value) {
                                                controller.isSelectedSwitch
                                                    .value = value;
                                               }))
                                          ]),
                                      SizedBox(height: 16.v),
                                      Container(
                                          width: 374.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 13.v),
                                          decoration: AppDecoration
                                              .fillGray10002
                                              .copyWith(
                                              borderRadius:
                                              BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Container(
                                              width: 322.h,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, right: 19.h),
                                              child: Text(
                                                  "msg_contrary_to_popular"
                                                      .tr,
                                                  maxLines: 3,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                      height: 1.50)))),
                                      SizedBox(height: 24.v),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                           Padding(
                                               padding:
                                               EdgeInsets.only(top: 5.v),
                                               child: Text(
                                                   "msg_show_nagative_prompt"
                                                       .tr,
                                                   style: theme.textTheme
                                                       .titleMedium)),
                                           Obx(() => CustomSwitch(
                                               value: controller
                                                   .isSelectedSwitch1.value,
                                               onChange: (value) {
                                                controller.isSelectedSwitch1
                                                    .value = value;
                                               }))
                                          ]),
                                      SizedBox(height: 16.v),
                                      Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 13.v),
                                          decoration: AppDecoration
                                              .fillGray10002
                                              .copyWith(
                                              borderRadius:
                                              BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(
                                                  top: 3.v, right: 10.h),
                                              child: Text(
                                                  "msg_this_cute_symbol".tr,
                                                  maxLines: 3,
                                                  overflow:
                                                  TextOverflow.ellipsis,
                                                  style: theme
                                                      .textTheme.bodyLarge!
                                                      .copyWith(
                                                      height: 1.50)))),
                                      SizedBox(height: 24.v),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                           Padding(
                                               padding: EdgeInsets.only(
                                                   top: 3.v, bottom: 2.v),
                                               child: Text(
                                                   "lbl_show_sfg_scale".tr,
                                                   style: theme.textTheme
                                                       .titleMedium)),
                                           Obx(() => CustomSwitch(
                                               value: controller
                                                   .isSelectedSwitch2.value,
                                               onChange: (value) {
                                                controller.isSelectedSwitch2
                                                    .value = value;
                                               }))
                                          ]),
                                      SizedBox(height: 16.v),
                                      Container(
                                        width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.h,
                                              vertical: 12.v),
                                          decoration: AppDecoration.fillGray50
                                              .copyWith(
                                              borderRadius:
                                              BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Text("lbl_9".tr,
                                              style:
                                              theme.textTheme.bodyLarge)),
                                      SizedBox(height: 24.v),
                                      Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                           Padding(
                                               padding: EdgeInsets.only(
                                                   top: 3.v, bottom: 2.v),
                                               child: Text(
                                                   "lbl_show_seed".tr,
                                                   style: theme.textTheme
                                                       .titleMedium)),
                                           Obx(() => CustomSwitch(
                                               value: controller
                                                   .isSelectedSwitch3.value,
                                               onChange: (value) {
                                                controller.isSelectedSwitch3
                                                    .value = value;
                                               }))
                                          ]),
                                      SizedBox(height: 16.v),
                                       CustomTextFormField(
                                           controller: controller.seedvalueoneController,
                                           hintText: "lbl_123654789654".tr,
                                           textInputAction: TextInputAction.done,

                                           borderDecoration: TextFormFieldStyleHelper.fillGray,
                                           fillColor: appTheme.gray10002,
                                           suffix: Container(
                                               margin: EdgeInsets.fromLTRB(
                                                   30.h, 14.v, 16.h, 14.v),
                                               child: CustomImageView(
                                                   svgPath: ImageConstant
                                                       .imgCopy1)),
                                           suffixConstraints:
                                           BoxConstraints(maxHeight: 48.v),
                                           validator: (value) {
                                             if (!isValidPhone(value)) {
                                               return "Please enter valid phone number";
                                             }
                                             return null;
                                           },
                                           contentPadding: EdgeInsets.only(
                                               left: 16.h,
                                               top: 13.v,
                                               bottom: 13.v)),
                                      // CustomTextFormField(
                                      //     controller: controller
                                      //         .seedvalueoneController,
                                      //     hintText: "lbl_123654789654".tr,
                                      //     textInputAction:
                                      //     TextInputAction.done,
                                      //     textInputType: TextInputType.phone,
                                      //     suffix: Container(
                                      //         margin: EdgeInsets.fromLTRB(
                                      //             30.h, 14.v, 16.h, 14.v),
                                      //         child: CustomImageView(
                                      //             svgPath: ImageConstant
                                      //                 .imgCopy1)),
                                      //     suffixConstraints:
                                      //     BoxConstraints(maxHeight: 48.v),
                                      //     validator: (value) {
                                      //      if (!isValidPhone(value)) {
                                      //       return "Please enter valid phone number";
                                      //      }
                                      //      return null;
                                      //     },
                                      //     contentPadding: EdgeInsets.only(
                                      //         left: 16.h,
                                      //         top: 13.v,
                                      //         bottom: 13.v))
                                     ])))),
                      SizedBox(height: 16.v),
                    ]))),
          ),
        ),
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
                             text: "lbl_share".tr,
                             margin: EdgeInsets.only(right: 10.h),
                             onTap: () {
                              // onTapShare();
                             })),
                     Expanded(
                         child: CustomElevatedButton(
                           onTap: (){
                             getDownloadDialogue(context,(){});
                           },
                             text: "lbl_download2".tr,
                             margin: EdgeInsets.only(left: 10.h)))
                    ])))),
  );
 }



 onTapFinalize() {
  Get.toNamed(
   AppRoutes.editArtworkScreen,
  );
 }
}







