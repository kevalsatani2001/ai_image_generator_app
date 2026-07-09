import '../controller/anime_generator_controller.dart';
import '../models/listview2_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listview2ItemWidget extends StatelessWidget {
  Listview2ItemWidget(
    this.listview2ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listview2ItemModel listview2ItemModelObj;

  var controller = Get.find<AnimeGeneratorController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.fillGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 88.h,
      child: Obx(
        () => CustomCheckboxButton(
          text: "lbl_1_1".tr,
          value: listview2ItemModelObj.checkBoxValue.value,
          onChange: (value) {
            listview2ItemModelObj.checkBoxValue.value = value;
          },
        ),
      ),
    );
  }
}
