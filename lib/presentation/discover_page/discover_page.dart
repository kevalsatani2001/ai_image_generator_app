import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../discover_page/widgets/discover_item_widget.dart';
import 'controller/discover_controller.dart';
import 'models/discover_item_model.dart';
import 'models/discover_model.dart';

// ignore_for_file: must_be_immutable
class DiscoverPage extends StatelessWidget {
  DiscoverPage({Key? key}) : super(key: key);

  DiscoverController discoverController =
      Get.put(DiscoverController());
  CustomBottomBarController customBottomBarController = Get.put(CustomBottomBarController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return
     GetBuilder<DiscoverController>(
       init: DiscoverController(),
       builder:(controller) =>  GridView.builder(
         padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 16.v),
primary: false,
         shrinkWrap: true,
         itemCount:controller.createdData.length,
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           mainAxisExtent: 208.v,
           crossAxisCount: 2,
           mainAxisSpacing: 20.h,
           crossAxisSpacing: 20.h), itemBuilder: (context, index) {
         DiscoverItemModel data = controller.createdData[index];
         return GestureDetector(
           onTap: (){
            Get.toNamed(AppRoutes.profileOneTabContainerScreen);
           },
           child: Container(

             child: Stack(
               alignment: Alignment.topCenter,
               children: [
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(16.h),
                     decoration: AppDecoration.fillGray10002.copyWith(
                       borderRadius: BorderRadiusStyle.roundedBorder8,
                     ),
                     child: Column(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         SizedBox(height: 35.v),
                         Text(
                           data.title!,
                           overflow: TextOverflow.ellipsis,
                           style: CustomTextStyles.titleMedium16_1,
                         ),
                         SizedBox(height: 1.v),
                         Text(
                           data.subTitle!,
                           overflow: TextOverflow.ellipsis,
                           style: CustomTextStyles.bodyMediumGray70013,
                         ),
                         SizedBox(height: 15.v),
                         CustomElevatedButton(
                           onTap: (){
                             data.isFollow = !data.isFollow!;
                             controller.update();
                           },
                           height: 32.v,
                           width: double.infinity,
                           text: data.isFollow!?"lbl_follow".tr:"Unfollow",
                           buttonStyle: data.isFollow!?CustomButtonStyles.outlinePrimaryTL8.copyWith(
                             backgroundColor: MaterialStatePropertyAll(appTheme.buttonColor),
                           ):CustomButtonStyles.outlinePrimaryTL8,
                           buttonTextStyle: data.isFollow!?CustomTextStyles.bodyLargeOnErrorContainer:CustomTextStyles.bodyLargeOnPrimaryContainer,
                         ),
                       ],
                     ),
                   ),
                 ),
                 CustomImageView(
                   imagePath:data.image,
                   height: 92.adaptSize,
                   width: 92.adaptSize,
                   radius: BorderRadius.circular(
                     46.h,
                   ),
                   alignment: Alignment.topCenter,
                 ),
               ],
             ),
           ),
         );
       },),
     );


      // Obx(() => GridView.builder(
      //   shrinkWrap: true,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       mainAxisExtent: 178.v,
      //       crossAxisCount: 2,
      //       mainAxisSpacing: 20.h,
      //       crossAxisSpacing: 20.h),
      //   physics: BouncingScrollPhysics(),
      //   itemCount: controller.discoverModelObj.value
      //       .discoverItemList.value.length,
      //   itemBuilder: (context, index) {
      //     DiscoverItemModel model = controller.discoverModelObj
      //         .value.discoverItemList.value[index];
      //     return DiscoverItemWidget(model,
      //         onTapImgIllustrationha: () {
      //           onTapImgIllustrationha();
      //         });
      //   }));
  }

  onTapImgIllustrationha() {
    Get.toNamed(
      AppRoutes.artworkPostScreen,
    );
  }
}
