import '../controller/home_screen_one_controller.dart';
import '../models/listview_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListviewItemWidget extends StatelessWidget {
  ListviewItemWidget(
    this.listviewItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ListviewItemModel listviewItemModelObj;

  var controller = Get.find<HomeScreenOneController>();

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
          value: listviewItemModelObj.checkBoxValue.value,
          onChange: (value) {
            listviewItemModelObj.checkBoxValue.value = value;
          },
        ),
      ),
    );
  }
}
