import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_5.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../art_styles_screen/controller/art_styles_controller.dart';
import 'controller/erase_object_controller.dart';


class EraseObjectScreen extends StatefulWidget {
  const EraseObjectScreen({super.key});

  @override
  State<EraseObjectScreen> createState() => _EraseObjectScreenState();
}

class _EraseObjectScreenState extends State<EraseObjectScreen> {
 EraseObjectController controller = Get.put(EraseObjectController());
 ArtStylesController artStylesController = Get.put(ArtStylesController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: () async{
    Get.back();
     return true;
   },
    child: ColorfulSafeArea(
     color: appTheme.white,
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                 getCommonAppBar("lbl_erase_object2".tr),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 24.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          CustomImageView(
                              imagePath:
                              artStylesController.currentArt!.image,
                              height: 374.adaptSize,
                              width: double.infinity,
                              radius: BorderRadius.circular(8.h)),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 25.v, right: 44.h, bottom: 5.v),
                              child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                   CustomImageView(
                                       svgPath: ImageConstant.imgTicket,
                                       height: 24.adaptSize,
                                       width: 24.adaptSize,
                                       margin: EdgeInsets.only(
                                           top: 7.v, bottom: 11.v)),
                                   Expanded(
                                       child: Container(
                                           width: 289.h,
                                           margin:
                                           EdgeInsets.only(left: 16.h),
                                           child: Text(
                                               "msg_you_can_erase_the".tr,
                                               maxLines: 2,
                                               overflow:
                                               TextOverflow.ellipsis,
                                               style: theme
                                                   .textTheme.bodyMedium!
                                                   .copyWith(height: 1.50))))
                                  ]))
                         ]))
                ])),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: CustomElevatedButton(
                    text: "lbl_next".tr,
                    onTap: () {
                     onTapNext();
                    })))),
  );
 }


 onTapNext() {
  Get.toNamed(
   AppRoutes.downloadArtworkScreen,
  );
 }


 onTapEraseobject() {
  Get.toNamed(
   AppRoutes.editArtworkScreen,
  );
 }
}




