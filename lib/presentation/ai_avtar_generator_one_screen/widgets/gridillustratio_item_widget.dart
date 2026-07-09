import '../../ai_avtar_generator_screen/controller/ai_avtar_generator_controller.dart';
import '../../ai_avtar_generator_screen/models/ai_avtar_generator_model.dart';
import '../controller/ai_avtar_generator_one_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridillustratioItemWidget extends StatelessWidget {
  GridillustratioItemWidget(
    this.gridillustratioItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AiAvtarGeneratorModel gridillustratioItemModelObj;

  AiAvtarGeneratorOneController controller = Get.put(AiAvtarGeneratorOneController());
  AiAvtarGeneratorController aiAvtarGeneratorController = Get.put(AiAvtarGeneratorController());

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
          alignment: Alignment.topRight,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: CustomImageView(
                imagePath: gridillustratioItemModelObj.image,
                height: 177.adaptSize,
                fit: BoxFit.fill,
                radius: BorderRadius.circular(
                  8.h,
                ),

              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 12.v,right: 12.h),
              child: Container(
                height: 24.v,
                width: 24.v,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appTheme.black900.withOpacity(0.40)
                ),
                child: Padding(
                  padding:  EdgeInsets.all(2.h),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgCloseOnerrorcontainer,
                  ),
                ),
              ),
            )


            // CustomIconButton(
            //   height: 24.adaptSize,
            //   width: 24.adaptSize,
            //   margin: EdgeInsets.only(
            //     top: 12.v,
            //     right: 12.h,
            //   ),
            //   padding: EdgeInsets.all(2.h),
            //   alignment: Alignment.topRight,
            //   child: CustomImageView(
            //     svgPath: ImageConstant.imgCloseOnerrorcontainer,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
