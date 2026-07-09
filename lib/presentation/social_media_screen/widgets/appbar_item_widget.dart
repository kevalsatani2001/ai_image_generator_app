import '../controller/social_media_controller.dart';
import '../models/appbar_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarItemWidget extends StatelessWidget {
  AppbarItemWidget(
    this.appbarItemModelObj, {
    Key? key,
    this.onTapSocialMediaButt,
  }) : super(
          key: key,
        );

  AppbarItemModel appbarItemModelObj;

  var controller = Get.find<SocialMediaController>();

  VoidCallback? onTapSocialMediaButt;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      height: 33.v,
      width: 191.h,
      text: "lbl_social_media".tr,
      margin: EdgeInsets.only(left: 20.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 16.h),
        child: CustomImageView(
          svgPath: ImageConstant.imgArrowleft,
        ),
      ),
      buttonStyle: CustomButtonStyles.none,
      buttonTextStyle: theme.textTheme.headlineSmall!,
      onTap: () {
        onTapSocialMediaButt?.call();
      },
    );
  }
}
