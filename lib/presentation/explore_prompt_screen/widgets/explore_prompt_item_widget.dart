import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../art_styles_screen/controller/art_styles_controller.dart';
import '../../art_styles_screen/models/artstyle_item_model.dart';
import '../../explore_prompt_photo_detail_popup_screen/controller/explore_prompt_photo_detail_popup_controller.dart';
import '../../explore_prompt_photo_detail_popup_screen/explore_prompt_photo_detail_popup_screen.dart';
import '../controller/explore_prompt_controller.dart';

// ignore: must_be_immutable
class ExplorePromptItemWidget extends StatelessWidget {
  ExplorePromptItemWidget(
    this.explorePromptItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ArtstyleItemModel explorePromptItemModelObj;

  ExplorePromptController controller = Get.put(ExplorePromptController());
  ExplorePromptPhotoDetailPopupController
      explorePromptPhotoDetailPopupController =
      Get.put(ExplorePromptPhotoDetailPopupController());
  ArtStylesController artStylesController = Get.put(ArtStylesController());
  VoidCallback? onTapImgIllustrationha;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        child: CustomImageView(
            imagePath: explorePromptItemModelObj.image!,
            fit: BoxFit.fill,
            radius: BorderRadius.circular(
              8.h,
            ),
            onTap: () {
              explorePromptPhotoDetailPopupController
                  .setCurrentImageData(explorePromptItemModelObj);
              artStylesController.setCurrentArt(explorePromptItemModelObj);
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return ExplorePromptPhotoDetailPopupScreen();
                },
              );
            }),
      ),
    );
  }
}
