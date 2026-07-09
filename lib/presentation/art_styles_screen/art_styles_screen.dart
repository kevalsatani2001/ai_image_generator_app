import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../art_styles_screen/widgets/artstyle_item_widget.dart';
import 'controller/art_styles_controller.dart';
import 'models/artstyle_item_model.dart';



class ArtStylesScreen extends StatefulWidget {
  const ArtStylesScreen({super.key});

  @override
  State<ArtStylesScreen> createState() => _ArtStylesScreenState();
}

class _ArtStylesScreenState extends State<ArtStylesScreen> {
 ArtStylesController controller = Get.put(ArtStylesController());

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
    onWillPop: () async{
      Get.back();
      return true;
    },
    child: ColorfulSafeArea(
      color: appTheme.white,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GetBuilder<ArtStylesController>(
              init: ArtStylesController(),
              builder: (controller) => Stack(
                children: [
                      SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                  getCommonAppBar("lbl_art_styles".tr),
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
                                          padding: EdgeInsets.only(bottom: controller.currentArtId != null?104.v:0.v),
                                            shrinkWrap: true,
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                mainAxisExtent: 215.v,
                                                crossAxisCount: 2,
                                                mainAxisSpacing: 20.h,
                                                crossAxisSpacing: 20.h),
                                            physics: BouncingScrollPhysics(),
                                            itemCount: controller
                                                .artStyleData
                                                .length,
                                            itemBuilder: (context, index) {
                                             ArtstyleItemModel model = controller
                                                 .artStyleData[index];
                                             return ArtstyleItemWidget(model,
                                                 onTapArtstyle: () {
                                                  onTapArtstyle();
                                                 });
                                            }))
                                   ]))))
                      ])),
                   controller.currentArtId != null? Align(
                     alignment: Alignment.bottomCenter,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Container(
                           color: appTheme.white,
                           child: Padding(
                             padding:  EdgeInsets.symmetric(vertical: 24.v),
                             child: CustomElevatedButton(

                                 width: 374.h,
                                 text: "lbl_continue".tr,
                                 onTap: () {
                                   Get.toNamed(
                                     AppRoutes.editArtworkScreen,
                                   );
                                 },
                                 alignment: Alignment.bottomCenter),
                           ),
                         ),
                       ],
                     ),
                   ):SizedBox()
                    ],
              ),
            ))),
  );
 }
 onTapArtstyle() {
  Get.toNamed(AppRoutes.artStylesSelectedScreen);
 }


 onTapArtstyles() {
  Get.toNamed(
   AppRoutes.homeScreenOneContainerScreen,
  );
 }
}

