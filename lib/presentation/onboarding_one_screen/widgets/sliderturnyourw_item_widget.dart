import '../controller/onboarding_one_controller.dart';
import '../models/sliderturnyourw_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SliderturnyourwItemWidget extends StatelessWidget {
  SliderturnyourwItemWidget(
    this.sliderturnyourwItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SliderturnyourwItemModel sliderturnyourwItemModelObj;

  var controller = Get.find<OnboardingOneController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "msg_turn_your_words".tr,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineMedium!.copyWith(
            height: 1.50,
          ),
        ),
        SizedBox(height: 12.v),
        Text(
          "msg_edward_feigenbaum".tr,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyLarge!.copyWith(
            height: 1.50,
          ),
        ),
      ],
    );
  }
}
