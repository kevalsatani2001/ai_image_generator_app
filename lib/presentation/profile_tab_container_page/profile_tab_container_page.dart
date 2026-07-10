import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_page/profile_page.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_title.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

import '../../core/expandable_pageview/src/expandable_page_view.dart';
import 'controller/profile_tab_container_controller.dart';
import 'models/profile_tab_container_model.dart';

// ignore_for_file: must_be_immutable
class ProfileTabContainerPage extends StatelessWidget {
  ProfileTabContainerPage({Key? key}) : super(key: key);

  ProfileTabContainerController controller =
      Get.put(ProfileTabContainerController(ProfileTabContainerModel().obs));
List tabs = [ ProfilePage(),
  ProfilePage(),
  ProfilePage()];
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Column(children: [
     Container(
         padding: EdgeInsets.symmetric(vertical: 17.v),
         decoration: AppDecoration.outlineGray,
         child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 6.v),
          CustomAppBar(
              title: AppbarTitle(
                  text: "lbl_profile".tr,
                  margin: EdgeInsets.only(left: 20.h)))
         ])),
     SizedBox(height: 16.v),
     Expanded(
         child: GetBuilder<ProfileTabContainerController>(
           init: controller,
           builder: (controller) {
             if (controller.isLoading) {
               return Center(child: CircularProgressIndicator(color: theme.colorScheme.primary));
             }

             String displayName = "${controller.firstName} ${controller.lastName}".trim();
             if (displayName.isEmpty) displayName = "User Profile";
             String username = controller.firstName.isNotEmpty 
                 ? "@${controller.firstName.toLowerCase()}" 
                 : "@username";

             return SingleChildScrollView(
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                  Center(
                    child: CustomImageView(
                        imagePath: controller.profileImage.isEmpty || controller.profileImage.startsWith('assets/')
                            ? ImageConstant.imgEllipse237104x104
                            : null,
                        url: controller.profileImage.isNotEmpty && !controller.profileImage.startsWith('assets/')
                            ? controller.profileImage
                            : null,
                        height: 104.adaptSize,
                        width: 104.adaptSize,
                        radius: BorderRadius.circular(52.h)),
                  ),
                  SizedBox(height: 20.v),
                  Center(
                    child: Text(displayName,
                        style: theme.textTheme.titleMedium),
                  ),
                  SizedBox(height: 3.v),
                  Center(
                    child: Text(username,
                        style: CustomTextStyles.bodyLargeGray700),
                  ),
                  Padding(
                      padding:
                      EdgeInsets.only(left: 20.h, top: 15.v, right: 20.h),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Container(
                               padding: EdgeInsets.symmetric(
                                   horizontal: 26.h, vertical: 17.v),
                               decoration: AppDecoration.fillGray10002
                                   .copyWith(
                                   borderRadius:
                                   BorderRadiusStyle.roundedBorder8),
                               child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                    Text(controller.postsCount.toString(),
                                        style: CustomTextStyles
                                            .titleMedium16_1),
                                    SizedBox(height: 9.v),
                                    Text("lbl_artwork".tr,
                                        style: theme.textTheme.bodyLarge)
                                   ])),
                           GestureDetector(
                               onTap: () {
                              Get.toNamed(AppRoutes.followerTabContainerScreen);
                               },
                               child: Container(
                                   margin: EdgeInsets.only(left: 16.h),
                                   padding: EdgeInsets.symmetric(
                                       horizontal: 20.h, vertical: 17.v),
                                   decoration: AppDecoration.fillGray10002
                                       .copyWith(
                                       borderRadius: BorderRadiusStyle
                                           .roundedBorder8),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                        Text(controller.followersCount.toString(),
                                            style: CustomTextStyles
                                                .titleMedium16_1),
                                        SizedBox(height: 9.v),
                                        Text("lbl_followers".tr,
                                            style:
                                            theme.textTheme.bodyLarge)
                                       ]))),
                           GestureDetector(
                               onTap: () {
                                 Get.toNamed(AppRoutes.followerTabContainerScreen);
                               },
                               child: Container(
                                   margin: EdgeInsets.only(left: 16.h),
                                   padding: EdgeInsets.symmetric(
                                       horizontal: 21.h, vertical: 15.v),
                                   decoration: AppDecoration.fillGray10002
                                       .copyWith(
                                       borderRadius: BorderRadiusStyle
                                           .roundedBorder8),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment:
                                       MainAxisAlignment.center,
                                       children: [
                                        SizedBox(height: 2.v),
                                        Text(controller.followingCount.toString(),
                                            style: CustomTextStyles
                                                .titleMedium16_1),
                                        SizedBox(height: 11.v),
                                        Text("lbl_following".tr,
                                            style:
                                            theme.textTheme.bodyLarge)
                                       ])))
                          ])),
              Padding(
                  padding:
                  EdgeInsets.only(left: 20.h, top: 16.v, right: 20.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Expanded(
                           child: CustomElevatedButton(
                               height: 40.v,
                               text: "lbl_edit_profile".tr,
                               buttonTextStyle: CustomTextStyles
                                   .titleMediumOnErrorContainerSemiBold,
                               onTap: () {
                                onTapEditprofile();
                               })),
                       CustomIconButton(
                         onTap: (){
                           Get.toNamed(AppRoutes.settingsScreen);
                         },
                           height: 40.adaptSize,
                           width: 40.adaptSize,
                           margin: EdgeInsets.only(left: 16.h),
                           padding: EdgeInsets.all(8.h),
                           decoration:
                           IconButtonStyleHelper.outlinePrimaryTL8,
                           child: CustomImageView(
                               svgPath: ImageConstant
                                   .imgSettingsBlack90040x40))
                      ])),
               Container(
                 height: 30.v,
                 width: 245.h,
                 margin: EdgeInsets.only(
                   left: 20.h,
                   top: 24.v,
                 ),
                 child: TabBar(
                   isScrollable: true,
                   tabAlignment: TabAlignment.start,
                   controller: controller.tabviewController,
                   labelPadding: EdgeInsets.only(left: 12.h, right: 12.h),
                   labelColor: theme.colorScheme.primary,
                   labelStyle: TextStyle(
                     fontSize: 16.fSize,
                     fontFamily: 'Open Sans',
                     fontWeight: FontWeight.w700,
                   ),
                   dividerColor: Colors.transparent,
                   unselectedLabelColor: appTheme.gray700,
                   unselectedLabelStyle: TextStyle(
                     fontSize: 16.fSize,
                     fontFamily: 'Open Sans',
                     fontWeight: FontWeight.w400,
                   ),
                   indicatorSize: TabBarIndicatorSize.tab,
                   indicatorPadding:
                   EdgeInsets.only(right: 20.h, left: 12.h),
                   indicatorWeight: 3.h,
                   indicatorColor: appTheme.blue,
                   tabs: [
                     Tab(child: Text("lbl_created".tr)),
                     Tab(child: Text("lbl_liked".tr)),
                     Tab(child: Text("lbl_saved".tr))
                   ],
                 ),
               ),
               SizedBox(height: 16.v,),
               ExpandablePageView.builder(
                 controller: controller.pageController,
                 onPageChanged: (value) {
                   controller.tabviewController.animateTo(value,
                       duration: const Duration(milliseconds: 300),
                       curve: Curves.ease);
                 },
                 itemCount: tabs.length,
                 itemBuilder: (context, index) {
                   return tabs[index];
                 },
               ),
              ]),
            );
          },
        ),
      ),
    ]);
  }

  /// Navigates to the profileOneTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the profileOneTabContainerScreen.
  onTapColumnweburl() {
    Get.toNamed(
      AppRoutes.profileOneTabContainerScreen,
    );
  }

  /// Navigates to the profileOneTabContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the profileOneTabContainerScreen.
  onTapColumnzipcode() {
    Get.toNamed(
      AppRoutes.profileOneTabContainerScreen,
    );
  }

  /// Navigates to the editProfileScreen when the action is triggered.

  /// When the action is triggered, this function uses the [Get] package to
  /// push the named route for the editProfileScreen.
  onTapEditprofile() {
    Get.toNamed(
      AppRoutes.editProfileScreen,
    );
  }
}
