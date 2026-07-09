import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/ai_avtar_generator_controller.dart';
import 'models/ai_avtar_generator_model.dart';



class AiAvtarGeneratorScreen extends StatefulWidget {
  const AiAvtarGeneratorScreen({super.key});

  @override
  State<AiAvtarGeneratorScreen> createState() => _AiAvtarGeneratorScreenState();
}

class _AiAvtarGeneratorScreenState extends State<AiAvtarGeneratorScreen> {
 AiAvtarGeneratorController aiAvtarGeneratorController = Get.put(AiAvtarGeneratorController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return ColorfulSafeArea(
   color: appTheme.white,
      child: Scaffold(
          body: GetBuilder<AiAvtarGeneratorController>(
            init: AiAvtarGeneratorController(),
            builder:(controller) =>  SizedBox(
                width: double.maxFinite,
                child: Column(children: [
             getCommonAppBar("AI avtar generator"),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 18.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Text("msg_pick_5_10_photos".tr,
                              style: theme.textTheme.bodyLarge),
                          SizedBox(height: 15.v),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 13.v),
                              decoration: AppDecoration.fillGray10002
                                  .copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.roundedBorder8),
                              child: Container(
                                  margin:
                                  EdgeInsets.only(left: 0.h, top: 2.v),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                       Padding(
                                         padding:  EdgeInsets.only(left: 16.h,right: 16.h),
                                         child: Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadiusStyle
                                                     .roundedBorder8),
                                             child: Row(
                                                 mainAxisSize:
                                                 MainAxisSize.min,
                                                 children: [
                                                  CustomIconButton(
                                                      height: 24.adaptSize,
                                                      width: 24.adaptSize,
                                                      padding:
                                                      EdgeInsets.all(3.h),
                                                      decoration:
                                                      IconButtonStyleHelper
                                                          .fillGreenA,
                                                      child: CustomImageView(
                                                          svgPath:
                                                          ImageConstant
                                                              .imgIcdone)),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          left: 12.h,
                                                          top: 2.v),
                                                      child: Text(
                                                          "lbl_good_photos"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .titleMedium16_1))
                                                 ])),
                                       ),
                                       SizedBox(height: 15.v),


                                       SizedBox(
                                         height: 100.v,
                                         child: ListView.builder(
                                           padding: EdgeInsets.symmetric(horizontal: 8.h),
                                           scrollDirection: Axis.horizontal,
                                           itemCount: controller.goodPhotos.length,
                                           itemBuilder: (context, index) {
                                             AiAvtarGeneratorModel data = controller.goodPhotos[index];
                                           return  Padding(
                                             padding:  EdgeInsets.symmetric(horizontal: 8.h),
                                             child: CustomImageView(
                                                 imagePath: data.image,
                                                 height: 100.adaptSize,
                                                 width: 100.adaptSize,
                                                 radius: BorderRadius
                                                     .circular(8.h)),
                                           );
                                         },),
                                       ),
                                       Padding(
                                         padding:  EdgeInsets.only(left: 16.h,right: 16.h),
                                         child: Container(
                                             width: double.infinity,
                                             margin: EdgeInsets.only(
                                                 top: 17.v, right: 9.h),
                                             child: Text(
                                                 "msg_close_up_selfies".tr,
                                                 maxLines: 2,
                                                 overflow:
                                                 TextOverflow.ellipsis,
                                                 style: theme
                                                     .textTheme.bodyLarge!
                                                     .copyWith(height: 1.50))),
                                       )
                                      ]))),
                          SizedBox(height: 16.v),
                          Container(
                              padding: EdgeInsets.symmetric(vertical: 13.v),
                              decoration: AppDecoration.fillGray10002
                                  .copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.roundedBorder8),
                              child: Container(
                                  margin:
                                  EdgeInsets.only(top: 2.v),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadiusStyle.roundedBorder8),
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                       Padding(
                                         padding:  EdgeInsets.only(left: 16.h,right: 16.h),
                                         child: Container(
                                             decoration: BoxDecoration(
                                                 borderRadius:
                                                 BorderRadiusStyle
                                                     .roundedBorder8),
                                             child: Row(
                                                 mainAxisSize:
                                                 MainAxisSize.min,
                                                 children: [
                                                  CustomIconButton(
                                                      height: 24.adaptSize,
                                                      width: 24.adaptSize,
                                                      padding:
                                                      EdgeInsets.all(3.h),
                                                      decoration:
                                                      IconButtonStyleHelper
                                                          .fillRed,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgCloseOnerrorcontainer)),
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          left: 12.h,
                                                          top: 2.v),
                                                      child: Text(
                                                          "lbl_bad_photos".tr,
                                                          style: CustomTextStyles
                                                              .titleMedium16_1))
                                                 ])),
                                       ),
                                       SizedBox(height: 15.v),
                                        SizedBox(
                                          height: 100.v,
                                          child: ListView.builder(
                                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.badPhotos.length,
                                            itemBuilder: (context, index) {
                                              AiAvtarGeneratorModel data = controller.badPhotos[index];
                                              return  Padding(
                                                padding:  EdgeInsets.symmetric(horizontal: 8.h),
                                                child: CustomImageView(
                                                    imagePath: data.image,
                                                    height: 100.adaptSize,
                                                    width: 100.adaptSize,
                                                    fit: BoxFit.fill,
                                                    radius: BorderRadius
                                                        .circular(8.h)),
                                              );
                                            },),
                                        ),
                                       Padding(
                                         padding:  EdgeInsets.only(left: 16.h,right: 16.h,top: 16.h),
                                         child: Container(
                                             width: double.infinity,
                                             child: Text(
                                                 "msg_group_pics_and_diffrent"
                                                     .tr,
                                                 maxLines: 2,
                                                 overflow:
                                                 TextOverflow.ellipsis,
                                                 style: theme
                                                     .textTheme.bodyLarge!
                                                     .copyWith(height: 1.50))),
                                       )
                                      ]))),
                          SizedBox(height: 5.v)
                         ]))
                ])),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
                  text: "lbl_upload".tr,
                  onTap: () {
                   onTapUpload();
                  }))));
 }

 onTapUpload() {
  Get.toNamed(
   AppRoutes.aiAvtarGeneratorOneScreen,
  );
 }
}




