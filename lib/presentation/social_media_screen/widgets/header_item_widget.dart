import '../controller/social_media_controller.dart';
import '../models/appbar_item_model.dart';
import '../models/header_item_model.dart';
import '../widgets/appbar_item_widget.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_17.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderItemWidget extends StatelessWidget {
  HeaderItemWidget(
    this.headerItemModelObj, {
    Key? key,
    this.onTapSocialMediaButt,
  }) : super(
          key: key,
        );

  HeaderItemModel headerItemModelObj;

  var controller = Get.find<SocialMediaController>();

  VoidCallback? onTapSocialMediaButt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 17.v),
      decoration: AppDecoration.outlineGray,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 6.v),
          CustomAppBar(
            title: AppbarButton17(
              margin: EdgeInsets.only(left: 20.h),
              onTap: () {
                onTapSocialMediaButt?.call();
              },
            )),
            // itemCount: headerItemModelObj.appbarItemList.value.length,
            // itemBuilder: (context, index) {
            //   AppbarItemModel model =
            //       headerItemModelObj.appbarItemList.value[index];
            //   return AppbarItemWidget(
            //     model,
            //     onTapSocialMediaButt: () {
            //       onTapSocialMediaButt();
            //     },
            //   );
            // },

        ],
      ),
    );
  }
}
