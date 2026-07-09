import '../controller/edit_artwork_two_controller.dart';
import '../models/edit_artwork_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditArtworkItemWidget extends StatelessWidget {
  EditArtworkItemWidget(
    this.editArtworkItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  EditArtworkItemModel editArtworkItemModelObj;

  var controller = Get.find<EditArtworkTwoController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 183.adaptSize,
      width: 183.adaptSize,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIllustrationha244x244,
            height: 183.adaptSize,
            width: 183.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.center,
          ),
          CustomIconButton(
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              right: 8.h,
              bottom: 8.v,
            ),
            padding: EdgeInsets.all(4.h),
            alignment: Alignment.bottomRight,
            child: CustomImageView(
              svgPath: ImageConstant.imgArrowdownOnerrorcontainer,
            ),
          ),
        ],
      ),
    );
  }
}
