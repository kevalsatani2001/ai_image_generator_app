import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../ai_avtar_generator_one_screen/widgets/gridillustratio_item_widget.dart';
import '../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';
import 'controller/ai_avtar_generator_one_controller.dart';

class AiAvtarGeneratorOneScreen extends StatefulWidget {
  const AiAvtarGeneratorOneScreen({super.key});

  @override
  State<AiAvtarGeneratorOneScreen> createState() => _AiAvtarGeneratorOneScreenState();
}

class _AiAvtarGeneratorOneScreenState extends State<AiAvtarGeneratorOneScreen> {
 AiAvtarGeneratorOneController controller = Get.put(AiAvtarGeneratorOneController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return ColorfulSafeArea(
   color: appTheme.white,
      child: Scaffold(
          body: GetBuilder<AiAvtarGeneratorController>(
            init: AiAvtarGeneratorController(),
            builder:(aiAvtarGeneratorController) =>  SizedBox(
                width: double.maxFinite,
                child: Column(children: [
               getCommonAppBar("AI avtar generator"),
                 Expanded(
                   child: Container(

                       width: double.maxFinite,
                       padding: EdgeInsets.symmetric(horizontal: 20.h),
                       child:
                       Stack(alignment: Alignment.bottomCenter, children: [
                        SizedBox(
                            width: double.maxFinite,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 16.v,),
                                     Text("msg_7_photos_have_been".tr,
                                         style:
                                         CustomTextStyles.titleMedium16_1),
                                     SizedBox(height: 20.v),
                                      Expanded(
                                        child: GridView.builder(
                                          padding: EdgeInsets.only(bottom: 104.v),
                                            shrinkWrap: true,
                                            primary: false,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent: 178.v,
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 20.h,
                                                crossAxisSpacing: 20.h),
                                            physics: BouncingScrollPhysics(),
                                            itemCount: aiAvtarGeneratorController.downlodedList
                                                .length+1,
                                            itemBuilder: (context, index) {

                                              return index==0?  GestureDetector(
                                                  onTap: () {
                                                    onTapColumnplusone();
                                                  },
                                                  child: Container(
                                                      decoration: AppDecoration
                                                          .fillGray10002
                                                          .copyWith(
                                                          borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder8),
                                                      child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            CustomIconButton(
                                                                height: 48.adaptSize,
                                                                width: 48.adaptSize,
                                                                padding:
                                                                EdgeInsets.all(
                                                                    12.h),
                                                                decoration:
                                                                IconButtonStyleHelper
                                                                    .fillOnErrorContainerTL24,
                                                                child: CustomImageView(
                                                                    svgPath:
                                                                    ImageConstant
                                                                        .imgPlus)),
                                                            SizedBox(height: 10.v),
                                                            Text("lbl_upload".tr,
                                                                style: CustomTextStyles
                                                                    .bodyLargePrimary)
                                                          ]))): GridillustratioItemWidget(
                                                  aiAvtarGeneratorController.downlodedList[index-1]);
                                            }),
                                      )
                                    ]))),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              color: appTheme.white,
                              child: Padding(
                                padding: EdgeInsets.only(top: 24.v,bottom: 24.v),
                                child: CustomElevatedButton(
                                    width: double.infinity,
                                    text: "lbl_generate".tr,
                                    onTap: () {
                                     onTapGenerate();
                                    },
                                    alignment: Alignment.bottomCenter),
                              ),
                            ),
                          ],
                        )
                       ])),
                 )
                ])),
          )));
 }

 onTapAiavtar() {
  Get.toNamed(
   AppRoutes.aiAvtarGeneratorScreen,
  );
 }

 onTapColumnplusone() {
  Get.toNamed(
   AppRoutes.aiAvtarGeneratorTwoScreen,
  );
 }
 onTapGenerate() {
  Get.toNamed(
   AppRoutes.editOneScreen,
  );
 }
}





