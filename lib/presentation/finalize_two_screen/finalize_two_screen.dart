import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/finalize_two_controller.dart';




class FinalizeTwoScreen extends StatefulWidget {
  const FinalizeTwoScreen({super.key});

  @override
  State<FinalizeTwoScreen> createState() => _FinalizeTwoScreenState();
}

class _FinalizeTwoScreenState extends State<FinalizeTwoScreen> {
 FinalizeTwoController controller = Get.put(FinalizeTwoController());
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
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                 getCommonAppBar("lbl_finalize".tr),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 24.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgIllustrationha24,
                              height: 374.adaptSize,
                              width: double.infinity,
                              radius: BorderRadius.circular(8.h)),
                          SizedBox(height: 26.v),
                          Text("lbl_add_title".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 18.v),
                          CustomTextFormField(
                              controller:
                              controller.actionBeautyfulController,
                              hintText: "msg_beautyful_women".tr,
                              textInputAction: TextInputAction.done,
                              borderDecoration:
                              TextFormFieldStyleHelper.fillGrayTL16,
                              fillColor: appTheme.gray50),
                          SizedBox(height: 5.v)
                         ]))
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
                          onTap: () {
                            getDownloadDialogue(context,(){});
                          },
                             width: 177.h, text: "lbl_download".tr)
                        ]))))),
  );
 }

 onTapArrowleftone() {
  Get.back();
 }
}


