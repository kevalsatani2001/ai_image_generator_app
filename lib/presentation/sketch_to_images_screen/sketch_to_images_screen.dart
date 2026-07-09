import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_9.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import '../edit_ten_screen/controller/edit_ten_controller.dart';
import 'controller/sketch_to_images_controller.dart';




class SketchToImagesScreen extends StatefulWidget {
  const SketchToImagesScreen({super.key});

  @override
  State<SketchToImagesScreen> createState() => _SketchToImagesScreenState();
}

class _SketchToImagesScreenState extends State<SketchToImagesScreen> {
 EditTenController editTenController = Get.put(EditTenController());
 SketchToImagesController controller = Get.put(SketchToImagesController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return SafeArea(
      child: Scaffold(
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               Container(
                   padding: EdgeInsets.symmetric(vertical: 20.v),
                   decoration: AppDecoration.outlineGray,
                   child: CustomAppBar(
                       title: AppbarButton9(
                           margin: EdgeInsets.only(left: 20.h),
                           onTap: () {
                            onTapSketchto();
                           }))),
               Container(
                   padding: EdgeInsets.symmetric(
                       horizontal: 20.h, vertical: 24.v),
                   child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                        SizedBox(
                            height: 374.adaptSize,
                            width: 374.adaptSize,
                            child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                 CustomImageView(
                                     imagePath:
                                     ImageConstant.imgRectangle7642,
                                     height: 374.adaptSize,
                                     width: 374.adaptSize,
                                     radius: BorderRadius.circular(8.h),
                                     alignment: Alignment.center),
                                 CustomIconButton(
                                     height: 24.adaptSize,
                                     width: 24.adaptSize,
                                     margin: EdgeInsets.only(
                                         top: 16.v, right: 16.h),
                                     padding: EdgeInsets.all(2.h),
                                     alignment: Alignment.topRight,
                                     child: CustomImageView(
                                         svgPath: ImageConstant
                                             .imgCloseOnerrorcontainer))
                                ])),
                        Container(
                            width: 336.h,
                            margin: EdgeInsets.only(
                                top: 17.v, right: 37.h, bottom: 5.v),
                            child: Text("msg_upload_your_sketch".tr,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles
                                    .bodyLargeOnPrimaryContainer
                                    .copyWith(height: 1.50)))
                       ]))
              ])),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
                  text: "lbl_generate".tr,
                  onTap: () {
                   onTapGenerate();
                  }))));
 }

 onTapGenerate() {
  Get.toNamed(
   AppRoutes.editTenScreen,
  );
 }

 onTapSketchto() {
  Get.toNamed(
   AppRoutes.sketchToImagesThreeScreen,
  );
 }
}






