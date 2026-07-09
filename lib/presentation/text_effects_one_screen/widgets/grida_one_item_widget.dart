import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/custom_image_text_effect.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../controller/text_effects_one_controller.dart';
import '../models/grida_one_item_model.dart';

// ignore: must_be_immutable
class GridaOneItemWidget extends StatelessWidget {
  GridaOneItemWidget(
    this.gridaOneItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GridaOneItemModel gridaOneItemModelObj;

  TextEffectsOneController controller = Get.put(TextEffectsOneController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextEffectsOneController>(
      init: TextEffectsOneController(),
      builder: (controller) => Container(
        decoration: AppDecoration.fillPink.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder8,
            border: Border.all(
                color: controller.curretTextEffextID == gridaOneItemModelObj.id
                    ? appTheme.blue
                    : Colors.transparent)),
        child: Column(
          children: [
            ImageTextEffectWidget(
              image: gridaOneItemModelObj.bgImage,
              text: gridaOneItemModelObj.title,
              style: CustomTextStyles.titleMediumOnErrorContainerwhite,
            ),
            CustomElevatedButton(
                onTap: () {
                  controller.setCurrentTextEffect(gridaOneItemModelObj);
                  // Get.toNamed(AppRoutes.)
                },
                height: 40.v,
                width: 145.h,
                text: "lbl_try_it".tr,
                buttonStyle: CustomButtonStyles.fillOnErrorContainer,
                buttonTextStyle: CustomTextStyles.titleMediumPrimarySemiBold),
          ],
        ),
      ),
    );
  }
}
