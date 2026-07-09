import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/input_images/controller/input_images_screen_controller.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_search_view.dart';
import 'model/input_image_model.dart';

class InputImagesScreen extends StatefulWidget {
  const InputImagesScreen({super.key});

  @override
  State<InputImagesScreen> createState() => _InputImagesScreenState();
}

class _InputImagesScreenState extends State<InputImagesScreen> {
  InputImagesController inputImagesController = Get.put(InputImagesController());
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
        color: appTheme.white,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GetBuilder<InputImagesController>(
              init: InputImagesController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    getCommonAppBar("Input images"),
                    Expanded(
                        child: SizedBox(
                            width: double.maxFinite,
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 11.v),
                                child: Column(children: [
                                  SizedBox(height: 5.v),
                                  CustomSearchView(
                                      controller: controller.searchController,
                                      hintText: "lbl_search".tr,
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              16.h, 16.v, 12.h, 16.v),
                                          child: CustomImageView(
                                              svgPath: ImageConstant.imgSearch)),
                                      prefixConstraints:
                                      BoxConstraints(maxHeight: 56.v),

                                      contentPadding: EdgeInsets.only(
                                          top: 17.v, right: 30.h, bottom: 17.v)),
                                  SizedBox(height: 16.v),
                               Expanded(
                                      child: GridView.builder(
                                          shrinkWrap: true,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 177.v,
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20.h,
                                              crossAxisSpacing: 20.h),
                                          physics: BouncingScrollPhysics(),
                                          itemCount: controller
                                              .uplodedimage!
                                              .length+1,
                                          itemBuilder: (context, index) {
                                            // InputImageModel model = controller
                                            //     .uplodedimage![index-1];
                                            return index == 0? GestureDetector(
                                              onTap: ()async {

                                                XFile? file = await picker.pickImage(source: ImageSource.gallery);
                                                controller.uplodedimage!.add(InputImageModel(file!.path));
                                                controller.update();
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 17.h,
                                                  vertical: 56.v,
                                                ),
                                                decoration:
                                                AppDecoration.outlineBlueGray.copyWith(
                                                  borderRadius: BorderRadiusStyle.roundedBorder8,
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    CustomIconButton(
                                                      height: 32.adaptSize,
                                                      width: 32.adaptSize,
                                                      padding: EdgeInsets.all(4.h),
                                                      decoration: IconButtonStyleHelper.fillGray,
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant.imgPlus,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.v),
                                                    Text(
                                                      "lbl_upload".tr,
                                                      style: CustomTextStyles.bodyMediumPrimary,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ):Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: FileImage(File(
                                                          controller.uplodedimage![index - 1].image!)),
                                                      fit: BoxFit.fill),
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                     8.h)),
                                            );
                                          }))
                                ]))))
                  ])),
            )));
  }
}
/*

 */
