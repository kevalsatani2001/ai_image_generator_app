import '../controller/more_popup_controller.dart';
import '../models/more_popup_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MorePopupItemWidget extends StatelessWidget {
  MorePopupItemWidget(
    this.morePopupItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  MorePopupItemModel morePopupItemModelObj;

  var controller = Get.find<MorePopupController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 177.adaptSize,
          width: 177.adaptSize,
          decoration: AppDecoration.fillGray10002.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgIllustrationha65,
            height: 177.adaptSize,
            width: 177.adaptSize,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
        ),
        Container(
          height: 177.adaptSize,
          width: 177.adaptSize,
          decoration: AppDecoration.fillGray10002.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgIllustrationha66,
            height: 177.adaptSize,
            width: 177.adaptSize,
            radius: BorderRadius.circular(
              15.h,
            ),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}
