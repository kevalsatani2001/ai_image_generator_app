import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_7.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../edit_five_screen/controller/edit_five_controller.dart';
import 'controller/finalize_four_controller.dart';



class FinalizeFourScreen extends StatefulWidget {
  const FinalizeFourScreen({super.key});

  @override
  State<FinalizeFourScreen> createState() => _FinalizeFourScreenState();
}

class _FinalizeFourScreenState extends State<FinalizeFourScreen> {
  FinalizeFourController controller = Get.put(FinalizeFourController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () async{
          Get.back();
          return true;
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ColorfulSafeArea(
              color: appTheme.whiteA700,
              child: GetBuilder<FinalizeFourController>(
                init: FinalizeFourController(),
                builder: (controller) =>
      GetBuilder<EditFiveController>(
                  init: EditFiveController(),
                  builder:(editFiveController) =>  SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                        getCommonAppBar("lbl_finalize".tr),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 0.h, vertical: 24.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  editFiveController.bdata == null?Container(
                                      height: 374.v,
                                      width: double.infinity,
                                      child: Center(child: Container(
                                          height: 50.v,
                                          width: 50.v,
                                          child: CircularProgressIndicator()))):
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                    child: Center(
                                      child: RepaintBoundary(
                                        key:controller.globalKey,
                                        child:ValueListenableBuilder(
                                          valueListenable: editFiveController.filterColor,
                                          builder: (context, color, child) {
                                            return  Container(
                                                height: 374.v,
                                                width: double.infinity,
                                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(8.h),
                                                    image: DecorationImage(image: MemoryImage(editFiveController.bdata!),fit: BoxFit.cover,
                                                        colorFilter: ColorFilter.mode(
                                                            color.withOpacity(0.5),
                                                            BlendMode.color)))
                                            );


                                          },
                                        ),
                                      ),

                                    ),
                                  ),

                                  // CustomImageView(
                                  //     imagePath: ImageConstant.imgRectangle76414,
                                  //     height: 374.adaptSize,
                                  //     width: 374.adaptSize,
                                  //     radius: BorderRadius.circular(8.h),
                                  //     margin: EdgeInsets.only(left: 1.h)),
                                  SizedBox(height: 24.v,),
                                  editFiveController.bdata == null?Center(child: CircularProgressIndicator()):FilterSelector(
                                    onFilterChanged: editFiveController.onFilterChanged,
                                    filters: editFiveController.filters, image: MemoryImage(editFiveController.bdata!,), imagesize: 100,
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(left: 20.h, top: 26.v,right: 20.h),
                                      child: Text("lbl_add_title".tr,
                                          style: theme.textTheme.titleMedium)),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                    child: CustomTextFormField(
                                        controller: controller.actonbehalfoneController,
                                        margin: EdgeInsets.only(
                                            left: 1.h, top: 18.v, bottom: 5.v),
                                        hintText: "msg_himself_while_acting".tr,
                                        textInputAction: TextInputAction.done),
                                  )
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
                              width: 173.h, text: "lbl_share".tr),
                          CustomElevatedButton(
                            onTap: () {
                              getDownloadDialogue(context, (){});
                            },
                              width: 177.h, text: "lbl_download".tr)
                        ])))));
  }

  onTapFinalize() {
    Get.toNamed(
      AppRoutes.editFiveScreen,
    );
  }
}






