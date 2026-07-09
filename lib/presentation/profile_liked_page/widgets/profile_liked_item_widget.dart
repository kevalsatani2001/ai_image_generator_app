import '../../discover_artwork_page/models/discover1_item_model.dart';
import '../controller/profile_liked_controller.dart';
import '../models/profile_liked_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileLikedItemWidget extends StatelessWidget {
  ProfileLikedItemWidget(
    this.profileLikedItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Discover1ItemModel profileLikedItemModelObj;

  ProfileLikedController controller = Get.put(ProfileLikedController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: CustomImageView(
        imagePath:profileLikedItemModelObj.image,
        radius: BorderRadius.circular(
          15.h,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
