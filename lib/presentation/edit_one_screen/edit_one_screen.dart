import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/edit_one_controller.dart';



class EditOneScreen extends StatefulWidget {
  const EditOneScreen({super.key});

  @override
  State<EditOneScreen> createState() => _EditOneScreenState();
}

class _EditOneScreenState extends State<EditOneScreen> {
  EditOneController controller = Get.put(EditOneController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return ColorfulSafeArea(
   color: appTheme.white,
      child: Scaffold(
          body: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
                getCommonAppBar("lbl_edit".tr,actionWidget: AppbarSubtitle(
                    text: "lbl_finalize".tr,
                    onTap: () {
                      onTapFinalize();
                    })),
               SizedBox(height: 24.v),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 20.h),
                 child: CustomImageView(
                     imagePath: ImageConstant.imgIllustrationha24,
                     height: 374.adaptSize,
                     width: double.infinity,
                     radius: BorderRadius.circular(8.h)),
               ),

              ])),
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
                           width: 177.h, text: "lbl_download".tr)
                      ])))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.aiAvtarGeneratorTwoScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeTwoScreen,
  );
 }
}



