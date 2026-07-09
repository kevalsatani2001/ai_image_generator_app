import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../images_to_painting_one_screen/controller/images_to_painting_one_controller.dart';
import 'controller/edit_four_controller.dart';



class EditFourScreen extends StatefulWidget {
  const EditFourScreen({super.key});

  @override
  State<EditFourScreen> createState() => _EditFourScreenState();
}

class _EditFourScreenState extends State<EditFourScreen> {
 EditFourController editFourController = Get.put(EditFourController());
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
            child: GetBuilder<EditFourController>(
              init: EditFourController(),
              builder:(controller) =>  GetBuilder<ImagesToPaintingOneController>(
               init: ImagesToPaintingOneController(),
                builder:(imagesToPaintingOneController) =>  SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                     getCommonAppBar("Edit",actionWidget: AppbarSubtitle(
                         text: "lbl_finalize".tr,
                         onTap: () {
                           editFourController.captureAndSaveImage();
                          onTapFinalize();
                         })),
                     Container(
                         padding: EdgeInsets.symmetric(vertical: 24.v),
                         child: Column(children: [
                          imagesToPaintingOneController.images == null?
                              Container(
                               height: 374.v,
                               width: double.infinity,
                               child: Center(
                                 child: Container(
                                  height: 50.v,
                                   width: 50.h,
                                   child: CircularProgressIndicator(
                                   ),
                                 ),
                               ),
                              )
                              : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.h),
                                child: RepaintBoundary(
                            key:controller.globalKey,
                                  child: ValueListenableBuilder(
                                    valueListenable: _filterColor,
                                    builder: (context, color, child) {
                                      return Container(
                                        height: 374.v,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8.h),
                                            image: DecorationImage(
                                                image: FileImage(File(imagesToPaintingOneController.images!.path)),
                                                fit: BoxFit.fill,
                                                colorFilter: ColorFilter.mode(
                                                    color.withOpacity(0.5),
                                                    BlendMode.color))),

                                      );


                                    },
                                  ),
                                ),
                              ),
                          SizedBox(height: 24.v),
                           FilterSelector(
                             onFilterChanged: _onFilterChanged,
                             filters: _filters, image: FileImage(File(imagesToPaintingOneController.images!.path)), imagesize: 100,
                           ),
                          SizedBox(height: 5.v)
                         ]))
                    ])),
              ),
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
                           editFourController.captureAndSaveImage();
                           getDownloadDialogue(context,(){});
                         },
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.imagesToPaintingScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeEightScreen,
  );
 }

 final _filters = [
   Colors.white,
   ...List.generate(
     Colors.primaries.length,
         (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
   )
 ];
 final _filterColor = ValueNotifier<Color>(Colors.white);

 void _onFilterChanged(Color value) {
   _filterColor.value = value;
 }
}







