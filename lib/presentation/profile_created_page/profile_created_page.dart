import '../discover_artwork_page/models/discover1_item_model.dart';
import '../profile_created_page/widgets/profile_created_item_widget.dart';
import 'controller/profile_created_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class ProfileCreatedPage extends StatelessWidget {
  ProfileCreatedPage({Key? key})
      : super(
          key: key,
        );

  ProfileCreatedController controller =
      Get.put(ProfileCreatedController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return GetBuilder<ProfileCreatedController>(
      init: ProfileCreatedController(),
      builder:(controller) =>  GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 16.v),
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 177.v,
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 20.h,
        ),
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.discoverArtworkData.length,
        itemBuilder: (context, index) {
          Discover1ItemModel model = controller.discoverArtworkData[index];
          return ProfileCreatedItemWidget(model);
        },
      ),
    );
  }
}
