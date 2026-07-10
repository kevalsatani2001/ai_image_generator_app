import '../../discover_artwork_page/models/discover1_item_model.dart';
import '../controller/profile_created_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileCreatedItemWidget extends StatelessWidget {
  ProfileCreatedItemWidget(
    this.profileCreatedItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Discover1ItemModel profileCreatedItemModelObj;

  ProfileCreatedController controller = Get.put(ProfileCreatedController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: CustomImageView(
        imagePath: profileCreatedItemModelObj.image,
        radius: BorderRadius.circular(
          8.h,
        ),
      fit: BoxFit.fill,
      ),
    );
  }
}
