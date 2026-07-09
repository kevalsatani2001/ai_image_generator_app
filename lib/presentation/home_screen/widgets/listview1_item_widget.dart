import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

import '../controller/home_controller.dart';
import '../models/aspect_ratio_model.dart';

// ignore: must_be_immutable
class Listview1ItemWidget extends StatelessWidget {
  Listview1ItemWidget(
    this.listview1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  AspectRatioModel listview1ItemModelObj;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.blue.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
          color: controller.currentSizeId == listview1ItemModelObj.id &&controller.currentSizeId != null
              ? appTheme.buttonColor
              : appTheme.lightblue),
      child: Row(
        children: [
          CustomImageView(
            svgPath: listview1ItemModelObj.sizeIcon,
            color: controller.currentSizeId == listview1ItemModelObj.id && controller.currentSizeId != null
                ? appTheme.white
                : appTheme.gray700,
          ),
          SizedBox(width: 8.h),
          Text(
            listview1ItemModelObj.size!,
            style: controller.currentSizeId == listview1ItemModelObj.id && controller.currentSizeId != null
                ?CustomTextStyles.titleMediumOnErrorContainer16: CustomTextStyles.titleMediumOnErrorContainer16black,
          )
        ],
      ),
    );
  }
}
