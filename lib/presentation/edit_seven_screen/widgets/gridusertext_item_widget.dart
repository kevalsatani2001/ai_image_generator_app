import '../controller/edit_seven_controller.dart';
import '../models/gridusertext_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridusertextItemWidget extends StatelessWidget {
  GridusertextItemWidget(
    this.gridusertextItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  GridusertextItemModel gridusertextItemModelObj;

  var controller = Get.find<EditSevenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgRectangle7646,
          height: 100.v,
          width: 78.h,
          radius: BorderRadius.circular(
            8.h,
          ),
        ),
        SizedBox(height: 4.v),
        Obx(
          () => Text(
            gridusertextItemModelObj.userText!.value,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
