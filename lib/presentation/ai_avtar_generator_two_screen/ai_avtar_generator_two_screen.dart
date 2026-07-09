import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';
import '../ai_avtar_generator_screen/models/ai_avtar_generator_model.dart';
import '../ai_avtar_generator_two_screen/widgets/gridillustratio1_item_widget.dart';
import 'controller/ai_avtar_generator_two_controller.dart';




class AiAvtarGeneratorTwoScreen extends StatefulWidget {
  const AiAvtarGeneratorTwoScreen({super.key});

  @override
  State<AiAvtarGeneratorTwoScreen> createState() => _AiAvtarGeneratorTwoScreenState();
}

class _AiAvtarGeneratorTwoScreenState extends State<AiAvtarGeneratorTwoScreen> {
  AiAvtarGeneratorTwoController controller  = Get.put(AiAvtarGeneratorTwoController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
        color: appTheme.white,
        child: Scaffold(
            body: GetBuilder<AiAvtarGeneratorController>(
              init: AiAvtarGeneratorController(),
              builder:(aiAvtarGeneratorController) =>  Stack(
                children: [
                  SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                        getCommonAppBar("AI avtar generator"),
                        Expanded(
                          child: GridView.builder(
                              padding: EdgeInsets.only(left: 20.h,right: 20.h,top: 16.h,bottom: 104),
                              primary: false,
                              shrinkWrap: true,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 178.v,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 20.h,
                                  crossAxisSpacing: 20.h),
                              physics: BouncingScrollPhysics(),
                              itemCount: aiAvtarGeneratorController.downlodedPendingPhotos.length,
                              itemBuilder: (context, index) {
                                AiAvtarGeneratorModel model =
                                aiAvtarGeneratorController.downlodedPendingPhotos[index];
                                return Gridillustratio1ItemWidget(model);
                              }),
                        )
                      ])),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          color: appTheme.white,
                          child: Padding(
                            padding: EdgeInsets.only(top: 24.v,bottom: 24.v),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomOutlinedButton(
                                      width: 177.h,

                                      text: "lbl_generate".tr,
                                      onTap: () {
                                        onTapGenerate();
                                      }),
                                  CustomElevatedButton(
                                      width: 177.h,
                                   text: "lbl_download".tr)
                                ]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  onTapAiavtar() {
    Get.toNamed(
      AppRoutes.aiAvtarGeneratorOneScreen,
    );
  }

  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editOneScreen,
    );
  }
}


