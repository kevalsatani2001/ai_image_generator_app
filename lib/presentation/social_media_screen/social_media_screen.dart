import 'package:ai_image_generator/core/app_export.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../social_media_screen/widgets/header_item_widget.dart';
import 'controller/social_media_controller.dart';
import 'models/header_item_model.dart';




class SocialMediaScreen extends StatefulWidget {
  const SocialMediaScreen({super.key});

  @override
  State<SocialMediaScreen> createState() => _SocialMediaScreenState();
}

class _SocialMediaScreenState extends State<SocialMediaScreen> {
  SocialMediaController socialMediaController = Get.put(SocialMediaController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () async{
          Get.back();
          return true;
        },
        child: Scaffold(
            body: ColorfulSafeArea(
              color: appTheme.white,
              child: GetBuilder<SocialMediaController>(
                init: SocialMediaController(),
                builder:(controller) =>  SizedBox(
                    width: double.maxFinite,
                    child:Column(
                      
                      children: [
                        getCommonAppBar("Social media"),
                        SizedBox(height: 12.v,),
                        ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.socialMediaList.length,
                          itemBuilder: (context, index) {
                            HeaderItemModel data = controller.socialMediaList[index];
                            return Padding(
                              padding:  EdgeInsets.symmetric(vertical: 12.v),
                              child: Container(
                                decoration: AppDecoration.fillGray10002.copyWith(
                                    borderRadius: BorderRadiusStyle.roundedBorder8),
                                child:  Padding(
                                  padding:  EdgeInsets.all(8.h),
                                  child: Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.all(12.h),

                                          decoration: BoxDecoration(
                                              color: theme.colorScheme.onErrorContainer,
                                              borderRadius: BorderRadius.circular(8.h)),
                                          child: CustomImageView(
                                              svgPath: data.icon)),
                                      SizedBox(width: 16.h,),
                                      Text(data.title!,style:CustomTextStyles.titleMedium16_1)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },),
                      ],
                    )




                ),
              ),
            )));
  }

  onTapSocialMediaButt() {
    Get.toNamed(AppRoutes.settingsScreen);
    Get.toNamed(
      AppRoutes.settingsScreen,
    );
  }
}



