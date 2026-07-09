import '../controller/art_styles_selected_controller.dart';
import '../models/artstyle1_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Artstyle1ItemWidget extends StatelessWidget {
  Artstyle1ItemWidget(
    this.artstyle1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Artstyle1ItemModel artstyle1ItemModelObj;

  var controller = Get.find<ArtStylesSelectedController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: AppDecoration.fillGray10002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgIllustrationha,
              height: 173.v,
              width: 177.h,
              radius: BorderRadius.vertical(
                top: Radius.circular(8.h),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12.h,
                top: 8.v,
                bottom: 9.v,
              ),
              child: Obx(
                () => Text(
                  artstyle1ItemModelObj.thecolourfull!.value,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
