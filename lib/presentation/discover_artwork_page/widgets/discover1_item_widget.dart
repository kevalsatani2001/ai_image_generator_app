import '../controller/discover_artwork_controller.dart';
import '../models/discover1_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Discover1ItemWidget extends StatelessWidget {
  Discover1ItemWidget(
    this.discover1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Discover1ItemModel discover1ItemModelObj;

  DiscoverArtworkController controller = Get.put(DiscoverArtworkController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: CustomImageView(
        imagePath: discover1ItemModelObj.image,
        height: double.infinity,
        width: double.infinity,
        radius: BorderRadius.circular(
          8.h,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
