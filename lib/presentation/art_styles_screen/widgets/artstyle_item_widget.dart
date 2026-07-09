import '../controller/art_styles_controller.dart';
import '../models/artstyle_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ArtstyleItemWidget extends StatelessWidget {
  ArtstyleItemWidget(
    this.artstyleItemModelObj, {
    Key? key,
    this.onTapArtstyle,
  }) : super(
          key: key,
        );

  ArtstyleItemModel artstyleItemModelObj;

  ArtStylesController controller = Get.put(ArtStylesController());

  VoidCallback? onTapArtstyle;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ArtStylesController>(
      init: ArtStylesController(),
        builder:(controller) =>  GestureDetector(
        onTap: () {
          // onTapArtstyle?.call();
          controller.setCurrentArt(artstyleItemModelObj);
        },
        child: Container(
          decoration:
          AppDecoration.fillGray10002.copyWith(
            border:
            Border.all(color: controller.currentArtId == artstyleItemModelObj.id && controller.currentArtId != null?appTheme.black900: appTheme.gray10002,
            width: controller.currentArtId == artstyleItemModelObj.id && controller.currentArtId != null?2.h:0),
            borderRadius: BorderRadiusStyle.roundedBorder8,
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.v),
            child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: artstyleItemModelObj.image!,
                  height: 173.v,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  radius: BorderRadius.vertical(
                    top: Radius.circular(8.h),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,


                  ),
                  child: Text(
                    artstyleItemModelObj.title!,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge,
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
