import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_image_1.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_title.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_pin_code_text_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_form_field.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import 'controller/logo_generator_controller.dart';


class LogoGeneratorScreen extends StatefulWidget {
  const LogoGeneratorScreen({super.key});

  @override
  State<LogoGeneratorScreen> createState() => _LogoGeneratorScreenState();
}

class _LogoGeneratorScreenState extends State<LogoGeneratorScreen> {
  LogoGeneratorController logoGeneratorController = Get.put(LogoGeneratorController());
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
              child: GetBuilder<LogoGeneratorController>(
                init: LogoGeneratorController(),
                builder:(controller) =>  SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                   getCommonAppBar("lbl_logo_generator2".tr),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 29.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h,bottom: 16.v),
                                    child: Text("lbl_enter_prompt".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                  child: CustomTextFormField(
                                    width: double.infinity,
                                    controller: controller.promtController,
                                    hintText: "msg_this_is_where_you_ll".tr,
                                    textInputAction: TextInputAction.done,
                                    maxLines: 3,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.h, vertical: 17.v),
                                  ),
                                ),

                                Padding(
                                    padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                    child: Text("lbl_aspect_ratio".tr,
                                        style: theme.textTheme.titleMedium)),
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
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                    child: Text("msg_back_ground_color".tr,
                                        style: theme.textTheme.titleMedium)),
                                Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: AppDecoration
                                        .fillGray10002
                                        .copyWith(
                                        borderRadius:
                                        BorderRadiusStyle
                                            .roundedBorder8),
                                    child: GridView.builder(
                                      padding: EdgeInsets.all(16.h),
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount:
                                      controller.defaultColors.length,
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 54.v,
                                          crossAxisCount: 5,
                                          mainAxisSpacing: 16.h,
                                          crossAxisSpacing: 18.h),
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            controller
                                                .setCurrentColorindex(
                                                index);
                                            // editController
                                            //     .captureAndSaveImage();
                                            // editController
                                            //     .captureAndSaveImage();
                                            // addNewCategoryController
                                            //     .onChange(color);
                                          },
                                          child: index == 0
                                              ? Container(
                                            decoration:
                                            BoxDecoration(
                                                image:
                                                DecorationImage(
                                                  image:
                                                  AssetImage(
                                                    ImageConstant
                                                        .imgLogoGeberaterBlankBackground,
                                                  ),
                                                ),
                                                border: Border.all(
                                                    color: controller.currentColorIndex ==
                                                        index
                                                        ? appTheme
                                                        .blue
                                                        : Colors
                                                        .transparent,
                                                    width: 2.v),
                                                shape: BoxShape
                                                    .circle),
                                          )
                                              : Container(
                                              height: 54.adaptSize,
                                              width: 54.adaptSize,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: controller
                                                          .currentColorIndex ==
                                                          index
                                                          ? appTheme
                                                          .blue
                                                          : Colors
                                                          .transparent,
                                                      width: 2.v),
                                                  color: controller
                                                      .defaultColors[
                                                  index],
                                                  shape: BoxShape
                                                      .circle)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]))
                    ])),
              ),
            ),
            bottomNavigationBar: CustomElevatedButton(
                text: "lbl_generate".tr,
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                onTap: () {
                  onTapGenerate();
                })));
  }

  onTapGenerate() {
    Get.toNamed(
      AppRoutes.editNineScreen,
    );
  }
  onTapArrowleftone() {
    Get.back();
  }
}





