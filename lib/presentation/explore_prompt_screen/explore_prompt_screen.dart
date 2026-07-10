import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../art_styles_screen/models/artstyle_item_model.dart';
import '../explore_prompt_screen/widgets/explore_prompt_item_widget.dart';
import 'controller/explore_prompt_controller.dart';



class ExplorePromptScreen extends StatefulWidget {
  const ExplorePromptScreen({super.key});

  @override
  State<ExplorePromptScreen> createState() => _ExplorePromptScreenState();
}

class _ExplorePromptScreenState extends State<ExplorePromptScreen> {
 ExplorePromptController controller = Get.put(ExplorePromptController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return ColorfulSafeArea(
color: appTheme.white,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
               getCommonAppBar("Explore prompt".tr),
               Expanded(
                   child: SizedBox(
                       width: double.maxFinite,
                       child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 20.h),
                           child: Column(children: [
                            SizedBox(height: 16.v),
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
                                suffix: Padding(
                                    padding: EdgeInsets.only(right: 15.h),
                                    child: IconButton(
                                        onPressed: () {
                                         controller.searchController
                                             .clear();
                                        },
                                        icon: Icon(Icons.clear,
                                            color: Colors.grey.shade600))),
                                contentPadding: EdgeInsets.only(
                                    top: 17.v, right: 30.h, bottom: 17.v)),
                            SizedBox(height: 32.v),
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
                                        .explorePromptList
                                        .length,
                                    itemBuilder: (context, index) {
                                     ArtstyleItemModel model =
                                     controller
                                         .explorePromptList[index];
                                     return ExplorePromptItemWidget(model,
                                     );
                                    }))
                           ]))))
              ]))));
 }


 onTapImgIllustrationha() {
  Get.toNamed(AppRoutes.explorePromptPhotoDetailPopupScreen);
 }


 onTapExploreprompt() {
  Get.toNamed(
   AppRoutes.homeScreenOneContainerScreen,
  );
 }
}



