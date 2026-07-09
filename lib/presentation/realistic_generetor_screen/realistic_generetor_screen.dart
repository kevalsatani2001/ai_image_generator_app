import 'dart:io';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_icon_button.dart';
import 'controller/realistic_generetor_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


class RealisticGeneretorScreen extends StatefulWidget {
  const RealisticGeneretorScreen({super.key});

  @override
  State<RealisticGeneretorScreen> createState() => _RealisticGeneretorScreenState();
}

class _RealisticGeneretorScreenState extends State<RealisticGeneretorScreen> {
  RealisticGeneretorController realisticGeneretorController = Get.put(RealisticGeneretorController());
  final ImagePicker picker = ImagePicker();

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
          child: GetBuilder<RealisticGeneretorController>(
            init: RealisticGeneretorController(),
            builder:(controller) => SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  getCommonAppBar("Realistic generetor"),
                  SizedBox(height: 24.v,),
                  Container(
                 width: double.infinity,
                    child: Column(
                      children: [
                        controller.images == null
                            ?getImageUploadMethod(() async {
                          XFile? file = await picker.pickImage(
                              source: ImageSource.gallery);
                          controller.images = file!;
                          controller.update();

                        }, "Upload an image")
                            :

                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                          child: Container(
                            height: 374.v,
                            width: double.infinity,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h)),
                            child: Stack(children: [
                              Image.file(
                                File(controller.images!.path),
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                              CustomIconButton(
                                  onTap: (){

                                      controller.images = null;
                                      controller.update();

                                  },
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin:
                                  EdgeInsets.only(top: 16.v, right: 16.h),
                                  padding: EdgeInsets.all(2.h),
                                  alignment: Alignment.topRight,
                                  child: CustomImageView(
                                      svgPath: ImageConstant
                                          .imgCloseOnerrorcontainer))
                            ]),
                          ),
                        ),
                        SizedBox(height: 17.v),
                        SizedBox(
                          width: 371.h,
                          child: Text(
                            "msg_you_can_upload_sketches".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargeOnPrimaryContainer
                                .copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: GetBuilder<RealisticGeneretorController>(
          init: RealisticGeneretorController(),
          builder:(controller) =>  Container(
            margin: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
              bottom: 24.v,
            ),
            decoration: AppDecoration.white,
            child: CustomElevatedButton(
              onTap:  controller.images == null?(){}:() {
               onTapGenerate();
              },
              text: "lbl_generate".tr,
            ),
          ),
        ),
      ),
    );
  }
  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editTwoScreen,
    );
  }
}





