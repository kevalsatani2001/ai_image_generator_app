import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../controlnet_one_screen/controller/controlnet_one_controller.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import 'controller/edit_five_controller.dart';


class EditFiveScreen extends StatefulWidget {
  const EditFiveScreen({super.key});

  @override
  State<EditFiveScreen> createState() => _EditFiveScreenState();
}

class _EditFiveScreenState extends State<EditFiveScreen> {
 EditFiveController editFiveController = Get.put(EditFiveController());
 // ControlnetOneController controlnetOneController = Get.put(ControlnetOneController());
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
            child: GetBuilder<EditFiveController>(
              init: EditFiveController(),
              builder:(controller) =>  GetBuilder<ControlnetOneController>(
                init: ControlnetOneController(),
                builder:(controlnetOneController) =>  SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                     getCommonAppBar("lbl_edit".tr,actionWidget: AppbarSubtitle(
                         text: "lbl_finalize".tr,
                         onTap: () {
                           controller.captureAndSaveImage();
                          onTapFinalize();
                         })),
                     Container(
                         padding: EdgeInsets.symmetric(vertical: 24.v),
                         child: Column(children: [
                           Padding(
                             padding:  EdgeInsets.symmetric(horizontal: 20.h),
                             child: Center(
                               child: RepaintBoundary(
                                 key:controller.globalKey,
                                 child:ValueListenableBuilder(
                                   valueListenable: controller.filterColor,
                                   builder: (context, color, child) {
                                     return  Container(
                                         height: 374.v,
                                         width: double.infinity,
                                         decoration:BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                                             image: DecorationImage(image: FileImage(File(controlnetOneController.images!.path),),fit: BoxFit.cover,
                                                 colorFilter: ColorFilter.mode(
                                                     color.withOpacity(0.5),
                                                     BlendMode.color)))
                                     );


                                   },
                                 ),
                               ),





                             ),
                           ),
                           SizedBox(height: 24.v,),
                           FilterSelector(
                             onFilterChanged: controller.onFilterChanged,
                             filters: controller.filters, image: FileImage(File(controlnetOneController.images!.path)), imagesize: 100,
                           ),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 20.h, top: 24.v,bottom: 16.v),
                                  child: Text("lbl_aspect_ratio".tr,
                                      style: theme.textTheme.titleMedium))),
                           SizedBox(height: 16.v,),
                           GetBuilder<HomeController>(
                             init: HomeController(),
                             builder: (homeController) =>  SizedBox(
                               height: 48.v,
                               child: ListView.builder(
                                 padding: EdgeInsets.only(left: 12.h, right: 12.h),
                                 itemCount: homeController.aspectRatioList.length,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context, index) {
                                   AspectRatioModel model =
                                   homeController.aspectRatioList[index];
                                   return Padding(
                                     padding: EdgeInsets.symmetric(horizontal: 8.h),
                                     child: GestureDetector(
                                       onTap: () {
                                         homeController.setCurrentSize(model.id);
                                       },
                                       child: Listview1ItemWidget(
                                         model,
                                       ),
                                     ),
                                   );
                                 },
                               ),
                             ),
                           ),
                         ]))
                    ])),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   CustomOutlinedButton(
                       width: 173.h, text: "lbl_generate".tr),
                   CustomElevatedButton(
                     onTap: () {
                       getDownloadDialogue(context, (){});
                     },
                       width: 177.h, text: "lbl_download".tr)
                  ]))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.controlnetScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeFourScreen,
  );
 }


}




