import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../realistic_generetor_screen/controller/realistic_generetor_controller.dart';
import 'controller/edit_two_controller.dart';




class EditTwoScreen extends StatefulWidget {
  const EditTwoScreen({super.key});

  @override
  State<EditTwoScreen> createState() => _EditTwoScreenState();
}

class _EditTwoScreenState extends State<EditTwoScreen> {
 EditTwoController editTwoController = Get.put(EditTwoController());
 RealisticGeneretorController realisticGeneretorController = Get.put(RealisticGeneretorController());
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
           color: appTheme.white,
            child: GetBuilder<EditTwoController>(
              init: EditTwoController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [

                   getCommonAppBar("lbl_edit".tr,actionWidget:    AppbarSubtitle(
                       text: "lbl_finalize".tr,
                       onTap: () {
                         controller.captureAndSaveImage();
                        onTapFinalize();
                       })),
                   Container(
                       padding: EdgeInsets.symmetric(vertical: 24.v),
                       child: Column(children: [

                         Padding(
                           padding: EdgeInsets.only(left: 20.h,right: 20.h),
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
                                         image: FileImage(File(realisticGeneretorController.images!.path)),
                                         fit: BoxFit.fill,
                                         colorFilter: ColorFilter.mode(
                                             color.withOpacity(0.5),
                                             BlendMode.color))),

                               );


                             },
                           ),
                         ),

                        // CustomImageView(
                        //     imagePath: ImageConstant.imgRectangle7641,
                        //     height: 374.adaptSize,
                        //     width:double.infinity,
                        //     radius: BorderRadius.circular(8.h)),
                        SizedBox(height: 24.v),
                         FilterSelector(
                           onFilterChanged: _onFilterChanged,
                           filters: _filters, image: FileImage(File(realisticGeneretorController.images!.path)), imagesize: 81,

                         ),

                        SizedBox(height: 5.v)
                       ]))
                  ])),
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
                         },
                           width: 177.h, text: "lbl_download_all".tr)
                      ])))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.realisticGeneretorFillScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.photoToAnimeOneScreen,
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



