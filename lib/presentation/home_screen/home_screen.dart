import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/custom_text_form_field.dart';
import '../art_styles_screen/controller/art_styles_controller.dart';
import '../art_styles_screen/models/artstyle_item_model.dart';
import '../art_styles_screen/widgets/artstyle_item_widget.dart';
import '../explore_prompt_photo_detail_popup_screen/explore_prompt_photo_detail_popup_screen.dart';
import '../explore_prompt_screen/controller/explore_prompt_controller.dart';
import '../explore_prompt_screen/widgets/explore_prompt_item_widget.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import '../input_images/controller/input_images_screen_controller.dart';
import '../input_images/model/input_image_model.dart';
import 'controller/home_controller.dart';
import 'models/aspect_ratio_model.dart';

class HomeScreen extends StatefulWidget {
  bool isNavigateHomeTab;
   HomeScreen({super.key,this.isNavigateHomeTab = true});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  ArtStylesController artStylesController = Get.put(ArtStylesController());
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return widget.isNavigateHomeTab?WillPopScope(
      onWillPop: ()async {
        Get.back();
        return true;
      },
      child: Scaffold(
        body: ColorfulSafeArea(
            color: appTheme.white,
            child: getHomePage()),
      ),
    ):getHomePage();
  }


  Widget getHomePage(){
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            SizedBox(
              height: 16.v,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                        height: 44.adaptSize,
                        width: 44.adaptSize,
                        imagePath: ImageConstant.imgEllipse249,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome ✨",
                              style: theme.textTheme.titleLarge,
                            ),
                            Text("John abram",
                                style: CustomTextStyles.bodyMediumGray700_1),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomImageView(
                    height: 24.adaptSize,
                    width: 24.adaptSize,
                    svgPath: ImageConstant.imgIcnotificatuion,
                  ),
                ],
              ),
            ),
            SizedBox(height: 26.v),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.h, right: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_enter_prompt".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 2.v),
                              child: GestureDetector(
                                onTap: (){
                                  Get.toNamed(AppRoutes.explorePromptScreen);
                                },
                                child: Text(
                                  "lbl_explore".tr,
                                  style:
                                  CustomTextStyles.titleMediumPrimarySemiBold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextFormField(
                          controller: controller.typeanythingController,
                          margin:
                          EdgeInsets.only(top: 15.v, right: 20.h, left: 20.h),
                          hintText: "lbl_type_anything".tr,
                          textInputAction: TextInputAction.done,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 33.v),
                          borderDecoration:
                          TextFormFieldStyleHelper.outlineBlueGrayTL8,
                          filled: false),
                      SizedBox(height: 28.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h, right: 20.h),
                        child: Text(
                          "lbl_aspect_ratio".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      SizedBox(
                        height: 16.v,
                      ),
                      SizedBox(
                        height: 48.v,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 12.h, right: 12.h),
                          itemCount: controller.aspectRatioList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            AspectRatioModel model =
                            controller.aspectRatioList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: GestureDetector(
                                onTap: () {
                                  controller.setCurrentSize(model.id);
                                },
                                child: Listview1ItemWidget(
                                  model,
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 28.v,
                            right: 20.h,
                            left: 20.h
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_art_style".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.artStylesScreen);
                              },
                              child: Text(
                                "lbl_view_all".tr,
                                style: CustomTextStyles.bodyMediumGray700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<ArtStylesController>(
                        init: ArtStylesController(),
                        builder:(artStylesController) => GridView.builder(
                            padding: EdgeInsets.only(top: 16.v,left: 20.h,right: 20.h),
                            primary: false,
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 213.v,
                                crossAxisCount: 2,
                                mainAxisSpacing: 20.h,
                                crossAxisSpacing: 20.h),
                            physics: BouncingScrollPhysics(),
                            itemCount: artStylesController.artStyleData.length>2?2:artStylesController.artStyleData.length,
                            itemBuilder: (context, index) {
                              ArtstyleItemModel model = artStylesController
                                  .artStyleData[index];
                              return ArtstyleItemWidget(model,
                                  onTapArtstyle: () {
                                    Get.toNamed(AppRoutes.artStylesSelectedScreen);
                                  });
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 24.v,
                            right: 20.h,
                            left: 20.h
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "lbl_input_images".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                            GestureDetector(
                              onTap: (){
                                Get.toNamed(AppRoutes.inputImagesScreen);
                              },
                              child: Text(
                                "lbl_view_all".tr,
                                style: CustomTextStyles.bodyMediumGray700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.v),
                      GetBuilder<InputImagesController>(
                        init: InputImagesController(),
                        builder:(inputImagesController) =>  SizedBox(
                          height: 177.v,
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            scrollDirection: Axis.horizontal,
                            itemCount: inputImagesController
                                .uplodedimage!
                                .length+1,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 10.h),
                                child: index == 0? GestureDetector(
                                  onTap: ()async {

                                    XFile? file = await picker.pickImage(source: ImageSource.gallery);
                                    inputImagesController.uplodedimage!.add(InputImageModel(file!.path));
                                    inputImagesController.update();
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    width: 82.h,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 0.h,
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
                                  height: 177.v,
                                  width: 177.v,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: FileImage(File(
                                              inputImagesController.uplodedimage![index - 1].image!)),
                                          fit: BoxFit.fill),
                                      borderRadius:
                                      BorderRadius.circular(
                                          8.h)),
                                ),
                              );
                            },),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       top: 24.v,
                      //       right: 20.h,
                      //       left: 20.h
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Explore prompt",
                      //         style: theme.textTheme.titleMedium,
                      //       ),
                      //       GestureDetector(
                      //         onTap: (){
                      //           Get.toNamed(AppRoutes.explorePromptScreen);
                      //         },
                      //         child: Text(
                      //           "lbl_view_all".tr,
                      //           style: CustomTextStyles.bodyMediumGray700,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // GetBuilder<ExplorePromptController>(
                      //   init: ExplorePromptController(),
                      //   builder:(explorePromptController) => GridView.builder(
                      //       padding: EdgeInsets.only(top: 16.v,left: 20.h,right: 20.h),
                      //       primary: false,
                      //       shrinkWrap: true,
                      //       gridDelegate:
                      //       SliverGridDelegateWithFixedCrossAxisCount(
                      //           mainAxisExtent: 177.v,
                      //           crossAxisCount: 2,
                      //           mainAxisSpacing: 20.h,
                      //           crossAxisSpacing: 20.h),
                      //       physics: BouncingScrollPhysics(),
                      //       itemCount: explorePromptController.explorePromptList.length>2?2:explorePromptController.explorePromptList.length,
                      //       itemBuilder: (context, index) {
                      //         ArtstyleItemModel model = explorePromptController.explorePromptList[index];
                      //         return ExplorePromptItemWidget(model,
                      //             onTapImgIllustrationha: () {
                      //               showModalBottomSheet(
                      //                 isScrollControlled: true,
                      //                 context: context, builder: (context) {
                      //                 return ExplorePromptPhotoDetailPopupScreen();
                      //               },);
                      //               // Get.toNamed(AppRoutes.explorePromptPhotoDetailPopupScreen);
                      //             });
                      //       }),
                      // ),
                      controller.currentSizeId != null? CustomElevatedButton(
                        text: "lbl_generate".tr,
                        margin: EdgeInsets.only(
                            top: 24.v,
                            right: 20.h,
                            left: 20.h
                        ),
                      ):CustomElevatedButton(
                        text: "lbl_generate".tr,
                        margin:
                        EdgeInsets.only(top: 24.v, right: 20.h,left: 20.h,bottom: 16.v),
                        buttonStyle: CustomButtonStyles.fillGray,
                        buttonTextStyle:
                        CustomTextStyles.titleMediumSemiBold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
