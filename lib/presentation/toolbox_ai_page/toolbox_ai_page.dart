import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/ai_avtar_generator_one_screen/ai_avtar_generator_one_screen.dart';
import 'package:flutter/material.dart';

import '../art_styles_screen/models/artstyle_item_model.dart';
import '../toolbox_ai_page/widgets/artstyle2_item_widget.dart';
import 'controller/toolbox_ai_controller.dart';
import 'models/artstyle2_item_model.dart';
import 'models/toolbox_ai_model.dart';

// ignore_for_file: must_be_immutable
class ToolboxAiPage extends StatefulWidget {
  ToolboxAiPage({Key? key}) : super(key: key);

  @override
  State<ToolboxAiPage> createState() => _ToolboxAiPageState();
}

class _ToolboxAiPageState extends State<ToolboxAiPage> {
  ToolboxAiController controller =
      Get.put(ToolboxAiController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    List toolboxAiClass = [
     AppRoutes.aiAvtarGeneratorScreen,
     AppRoutes.homeScreen,
     AppRoutes.photoToAnimeThreeScreen,
     AppRoutes.photoToAnimeThreeScreen,
     // AppRoutes.photoToAnimeScreen,
     AppRoutes.realisticGeneretorScreen,
     AppRoutes.textEffectsOneScreen,
     AppRoutes.sketchToImagesThreeScreen,
     AppRoutes.imagesToPaintingOneScreen,
     AppRoutes.recolourImageScreen,
     AppRoutes.extendImagesScreen,
     AppRoutes.dToImagesScreen,
     AppRoutes.sketchToImagesFourScreen,
     AppRoutes.logoGeneratorScreen,
     AppRoutes.controlnetOneScreen,
     AppRoutes.batchArtGeneratorOneScreen,
    ];
    return Container(
        width: double.maxFinite,
        decoration: AppDecoration.white,
        child: Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                     width: double.maxFinite,
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 17.v),
                     decoration: AppDecoration.outlineGray,
                     child: Column(
                         mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment:
                         CrossAxisAlignment.start,
                         children: [
                          SizedBox(height: 6.v),
                          Text("lbl_toolbox_ai".tr,
                              style:
                              theme.textTheme.headlineSmall)
                         ])),
                 Expanded(
                   child: GridView.builder(
                       padding: EdgeInsets.only(
                           left: 20.h, top: 16.v, right: 20.h),
                       shrinkWrap: true,
                       primary: false,
                       gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                           mainAxisExtent: 182.v,
                           crossAxisCount: 2,
                           mainAxisSpacing: 20.h,
                           crossAxisSpacing: 20.h),

                       itemCount: controller.toolboxai.length,
                       itemBuilder: (context, index) {
                        ArtstyleItemModel model =
                        controller.toolboxai[index];
                        return Artstyle2ItemWidget(model,
                            onTapArtstyle: () {
                              Get.toNamed(toolboxAiClass[index]);
                         // if(index==1){
                         //
                         // }
                         // else{
                         //    Get.toNamed(toolboxAiClass[index]);}
                            });
                       }),
                 ),

                ])));
  }

  onTapArtstyle() {
    Get.toNamed(
      AppRoutes.photoToAnimeThreeScreen,
    );
  }
}
