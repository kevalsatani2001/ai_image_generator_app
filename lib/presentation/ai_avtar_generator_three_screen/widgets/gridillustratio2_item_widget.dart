import '../controller/ai_avtar_generator_three_controller.dart';
import '../models/gridillustratio2_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gridillustratio2ItemWidget extends StatelessWidget {
  Gridillustratio2ItemWidget(
    this.gridillustratio2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Gridillustratio2ItemModel gridillustratio2ItemModelObj;

  var controller = Get.find<AiAvtarGeneratorThreeController>();

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
