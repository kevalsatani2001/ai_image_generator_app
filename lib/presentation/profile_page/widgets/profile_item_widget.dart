import '../../art_styles_screen/models/artstyle_item_model.dart';
import '../controller/profile_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget(
    this.profileItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ArtstyleItemModel profileItemModelObj;

  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: AppDecoration.fillGray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: CustomImageView(
        imagePath: profileItemModelObj.image,
        radius: BorderRadius.circular(
          8.h,
        ),
       fit: BoxFit.fill,
      ),
    );
  }
}
