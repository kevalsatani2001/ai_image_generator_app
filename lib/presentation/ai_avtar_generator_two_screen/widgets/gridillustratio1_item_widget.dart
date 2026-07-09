import '../../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';
import '../../ai_avtar_generator_screen/models/ai_avtar_generator_model.dart';
import '../controller/ai_avtar_generator_two_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Gridillustratio1ItemWidget extends StatelessWidget {
  Gridillustratio1ItemWidget(
    this.gridillustratio1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AiAvtarGeneratorModel gridillustratio1ItemModelObj;

  AiAvtarGeneratorTwoController aiAvtarGeneratorTwoController = Get.put(AiAvtarGeneratorTwoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiAvtarGeneratorController>(
      init: AiAvtarGeneratorController(),
      builder:(controller) =>  Align(
        alignment: Alignment.topCenter,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          color: appTheme.gray10002,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Container(
            height: 177.adaptSize,
            width: double.infinity,
            decoration: AppDecoration.fillGray10002.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CustomImageView(
                  imagePath: gridillustratio1ItemModelObj.image,
                  height: 177.adaptSize,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  radius: BorderRadius.circular(
                    8.h,
                  ),

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
                    onTap: () {
                      controller.changeDownloadPos(gridillustratio1ItemModelObj);

                    },
                    svgPath: ImageConstant.imgArrowdownOnerrorcontainer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
