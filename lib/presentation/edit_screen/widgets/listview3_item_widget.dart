import '../controller/edit_controller.dart';
import '../models/listview3_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_checkbox_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Listview3ItemWidget extends StatelessWidget {
  Listview3ItemWidget(
    this.listview3ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Listview3ItemModel listview3ItemModelObj;

  var controller = Get.find<EditController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.blue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 88.h,
      child: Obx(
        () => CustomCheckboxButton(
          text: "lbl_1_1".tr,
          value: listview3ItemModelObj.checkboxValue.value,
          textStyle: CustomTextStyles.titleMediumOnErrorContainer16,
          onChange: (value) {
            listview3ItemModelObj.checkboxValue.value = value;
          },
        ),
      ),
    );
  }
}
