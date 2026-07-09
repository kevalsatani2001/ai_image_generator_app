import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_4.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../successful_screen/successful_screen.dart';
import 'controller/edit_artwork_one_controller.dart';



class EditArtworkOneScreen extends StatefulWidget {
  const EditArtworkOneScreen({super.key});

  @override
  State<EditArtworkOneScreen> createState() => _EditArtworkOneScreenState();
}

class _EditArtworkOneScreenState extends State<EditArtworkOneScreen> {
  EditArtworkOneController controller = Get.put(EditArtworkOneController());
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
            color: appTheme.white,
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [

                  getCommonAppBar("lbl_edit".tr,actionWidget:  AppbarSubtitle(
                      text: "lbl_finalize".tr,)),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.h, vertical: 24.v),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath:
                                ImageConstant.imgIllustrationha374x374,
                                height: 374.adaptSize,
                                width: double.infinity,
                                radius: BorderRadius.circular(8.h)),
                            SizedBox(height: 26.v),
                            Text("lbl_add_title".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 18.v),
                            CustomTextFormField(
                                controller:
                                controller.actionbeautyfulController,
                                hintText: "msg_beautyful_man_edit".tr,
                                textInputAction: TextInputAction.done),
                            SizedBox(height: 5.v)
                          ]))
                ])),
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
                            getDownloadDialogue(context,(){});
                          },
                            width: 177.h, text: "lbl_download".tr)
                      ])))),
    );
  }

  onTapEdit() {
    Get.toNamed(
      AppRoutes.photoToAnimeTwoScreen,
    );
  }
}



