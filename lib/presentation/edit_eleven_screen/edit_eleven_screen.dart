import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../d_to_images_screen/controller/d_to_images_controller.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import 'controller/edit_eleven_controller.dart';



class EditElevenScreen extends StatefulWidget {
  const EditElevenScreen({super.key});

  @override
  State<EditElevenScreen> createState() => _EditElevenScreenState();
}

class _EditElevenScreenState extends State<EditElevenScreen> {
 EditElevenController editElevenController = Get.put(EditElevenController());

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
           child: GetBuilder<EditElevenController>(
             init: EditElevenController(),
             builder:(controller) =>  GetBuilder<DToImagesController>(
               init: DToImagesController(),
               builder:(dToImagesController) =>  SizedBox(
                   width: double.maxFinite,
                   child: Column(children: [

                     getCommonAppBar("lbl_edit".tr,actionWidget:AppbarSubtitle(
                         text: "lbl_finalize".tr,
                         onTap: () {
                           controller.captureAndSaveImage();
                           onTapFinalize();
                         }) ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 19.h, vertical: 24.v),
                        child: Column(children: [

                          RepaintBoundary(
                            key:controller.globalKey,
                            child:ValueListenableBuilder(
                              valueListenable: _filterColor,
                              builder: (context, color, child) {
                                return Container(
                                  height: 374.v,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(8.h),
                                      image: DecorationImage(
                                          image: FileImage(File(dToImagesController.images!.path)),
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                              color.withOpacity(0.5),
                                              BlendMode.color))),

                                );


                              },
                            ),
                          ),
                         SizedBox(height: 24.v),
                          FilterSelector(
                            onFilterChanged: _onFilterChanged,
                            filters: _filters, image: FileImage(File(dToImagesController.images!.path)), imagesize: 100,
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
                           getDownloadDialogue(context, (){});
                         },
                           width: 177.h, text: "lbl_download_all".tr)
                      ])))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.sketchToImagesOneScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeSixScreen,
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




