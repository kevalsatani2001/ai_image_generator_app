import '../controller/batch_art_generator_controller.dart';
import '../models/batch_art_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BatchArtItemWidget extends StatelessWidget {
  BatchArtItemWidget(
    this.batchArtItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  BatchArtItemModel batchArtItemModelObj;

  var controller = Get.find<BatchArtGeneratorController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: appTheme.gray10002,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Container(
        height: 177.adaptSize,
        width: 177.adaptSize,
        decoration: AppDecoration.fillGray10002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgIllustrationha244x244,
              height: 177.adaptSize,
              width: 177.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
              alignment: Alignment.center,
            ),
            CustomIconButton(
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.only(
                right: 12.h,
                bottom: 12.v,
              ),
              padding: EdgeInsets.all(4.h),
              alignment: Alignment.bottomRight,
              child: CustomImageView(
                svgPath: ImageConstant.imgArrowdownOnerrorcontainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
