import '../discover_artwork_page/widgets/discover1_item_widget.dart';
import 'controller/discover_artwork_controller.dart';
import 'models/discover1_item_model.dart';
import 'models/discover_artwork_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class DiscoverArtworkPage extends StatefulWidget {
  DiscoverArtworkPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<DiscoverArtworkPage> createState() => _DiscoverArtworkPageState();
}

class _DiscoverArtworkPageState extends State<DiscoverArtworkPage> {
  DiscoverArtworkController discoverArtworkController =
      Get.put(DiscoverArtworkController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return GetBuilder<DiscoverArtworkController>(
      init: DiscoverArtworkController(),
      builder:(controller) =>  GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 16.v),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 177.v,
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 20.h,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: controller.discoverArtworkData.length,
        itemBuilder: (context, index) {
          Discover1ItemModel model = controller.discoverArtworkData[index];
          return GestureDetector(
            onTap: (){
              Get.toNamed(AppRoutes.artworkPostScreen);
            },
            child: Discover1ItemWidget(
              model,
            ),
          );
        },
      ),
    );
  }
}
