import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_3.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

import '../art_styles_selected_screen/widgets/artstyle1_item_widget.dart';
import 'controller/art_styles_selected_controller.dart';
import 'models/artstyle1_item_model.dart';

class ArtStylesSelectedScreen extends GetWidget<ArtStylesSelectedController> {
  const ArtStylesSelectedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 20.v),
                      decoration: AppDecoration.outlineGray10001,
                      child: CustomAppBar(
                          title: AppbarButton3(
                              margin: EdgeInsets.only(left: 20.h),
                              onTap: () {
                                onTapArtstyles();
                              }))),
                  Column(children: [
                    CustomSearchView(
                        margin:
                            EdgeInsets.only(left: 20.h, top: 16.v, right: 20.h),
                        controller: controller.searchController,
                        hintText: "lbl_search".tr,
                        prefix: Container(
                            margin: EdgeInsets.fromLTRB(16.h, 16.v, 12.h, 16.v),
                            child: CustomImageView(
                                svgPath: ImageConstant.imgSearch)),
                        prefixConstraints: BoxConstraints(maxHeight: 56.v),
                        suffix: Padding(
                            padding: EdgeInsets.only(right: 15.h),
                            child: IconButton(
                                onPressed: () {
                                  controller.searchController.clear();
                                },
                                icon: Icon(Icons.clear,
                                    color: Colors.grey.shade600))),
                        contentPadding: EdgeInsets.only(
                            top: 17.v, right: 30.h, bottom: 17.v)),
                    SizedBox(height: 16.v),
                    Container(
                        height: 690.v,
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 11.v),
                                  child: Obx(() => GridView.builder(
                                      shrinkWrap: true,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisExtent: 214.v,
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20.h,
                                              crossAxisSpacing: 20.h),
                                      physics: BouncingScrollPhysics(),
                                      itemCount: controller
                                          .artStylesSelectedModelObj
                                          .value
                                          .artstyle1ItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                        Artstyle1ItemModel model = controller
                                            .artStylesSelectedModelObj
                                            .value
                                            .artstyle1ItemList
                                            .value[index];
                                        return Artstyle1ItemWidget(model);
                                      })))),
                          CustomElevatedButton(
                              width: 374.h,
                              text: "lbl_continue".tr,
                              margin: EdgeInsets.only(bottom: 24.v),
                              onTap: () {
                                onTapContinue();
                              },
                              alignment: Alignment.bottomCenter)
                        ]))
                  ])
                ]))));
  }

  /// Navigates to the homeScreenOneContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the homeScreenOneContainerScreen.
  onTapArtstyles() {
    Get.toNamed(
      AppRoutes.homeScreenOneContainerScreen,
    );
  }

  /// Navigates to the editArtworkScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editArtworkScreen.
  onTapContinue() {
    Get.toNamed(
      AppRoutes.editArtworkScreen,
    );
  }
}
