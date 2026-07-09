import '../controller/profile_one_controller.dart';
import '../models/userprofile1_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  Userprofile1ItemWidget(
    this.userprofile1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofile1ItemModel userprofile1ItemModelObj;

  var controller = Get.find<ProfileOneController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208.v,
      width: 177.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16.h),
              decoration: AppDecoration.fillGray10002.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 35.v),
                  Obx(
                    () => Text(
                      userprofile1ItemModelObj.userName!.value,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleMedium16_1,
                    ),
                  ),
                  SizedBox(height: 1.v),
                  Obx(
                    () => Text(
                      userprofile1ItemModelObj.userDescription!.value,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMediumGray70013,
                    ),
                  ),
                  SizedBox(height: 15.v),
                  CustomElevatedButton(
                    height: 32.v,
                    width: 145.h,
                    text: "lbl_follow".tr,
                    buttonTextStyle: CustomTextStyles.bodyLargeOnErrorContainer,
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEllipse237,
            height: 92.adaptSize,
            width: 92.adaptSize,
            radius: BorderRadius.circular(
              46.h,
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }
}
