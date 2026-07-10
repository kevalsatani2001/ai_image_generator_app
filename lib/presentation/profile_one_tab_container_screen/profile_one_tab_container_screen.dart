import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_created_page/profile_created_page.dart';
import 'package:ai_image_generator/presentation/profile_liked_page/profile_liked_page.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../core/expandable_pageview/src/expandable_page_view.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'controller/profile_one_tab_container_controller.dart';
import 'models/popu_up_menu_item_model.dart';

class ProfileOneTabContainerScreen extends StatefulWidget {
  const ProfileOneTabContainerScreen({super.key});

  @override
  State<ProfileOneTabContainerScreen> createState() =>
      _ProfileOneTabContainerScreenState();
}

class _ProfileOneTabContainerScreenState
    extends State<ProfileOneTabContainerScreen> {
  ProfileOneTabContainerController controller =
      Get.put(ProfileOneTabContainerController());
  List tabs = [
    ProfileCreatedPage(),
    ProfileLikedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true;
      },
      child: Scaffold(
        body: ColorfulSafeArea(
          color: appTheme.whiteA700,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCommonAppBar("Profile"),
              SizedBox(
                height: 16.v,
              ),
              Expanded(
                child: ListView(
                  children: [
                    GetBuilder<ProfileOneTabContainerController>(
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

                        return Column(
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
                          ],
                        );
                      },
                    ),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 20.h, top: 16.v, right: 20.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CustomElevatedButton(
                                      height: 40.v,
                                      width: double.infinity,
                                      text: "Follow",
                                      buttonTextStyle: CustomTextStyles
                                          .titleMediumOnErrorContainerSemiBold,
                                      onTap: () {
                                        // onTapEditprofile();
                                      })),
                              PopupMenuButton<PopupmenuItemModel>(
                                color: appTheme.whiteA700,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
                                icon: CustomIconButton(
                                    height: 40.adaptSize,
                                    width: 40.adaptSize,
                                    margin: EdgeInsets.only(left: 16.h),
                                    padding: EdgeInsets.all(8.h),
                                    decoration:
                                        IconButtonStyleHelper.fillGrayTL8,
                                    child: CustomImageView(
                                        svgPath:
                                            ImageConstant.imgMoreVertRounded)),
                                // Callback that sets the selected popup menu item.
                                onSelected: (PopupmenuItemModel item) {
                                  // setState(() {
                                  //   selectedMenu = item;
                                  // });
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<PopupmenuItemModel>>[
                                  PopupMenuItem<PopupmenuItemModel>(
                                    child: popupmenuItemFormate((){
                          
                                    },controller.popupMenuItemList[0].icon, controller.popupMenuItemList[0].title!)
                                  ),
                                      PopupMenuItem<PopupmenuItemModel>(
                                          child: popupmenuItemFormate((){
                                            Get.back();
                                            Get.toNamed(AppRoutes.showQrCodeScreen);
                                          },controller.popupMenuItemList[1].icon, controller.popupMenuItemList[1].title!)
                                      ),
                                      PopupMenuItem<PopupmenuItemModel>(
                                          child: popupmenuItemFormate(()async{
                                            Get.back();
                                            await Share.share('Hello Welcome to FlutterCampus', subject: 'Welcome Message');
                                          },controller.popupMenuItemList[2].icon, controller.popupMenuItemList[2].title!)
                                      ),
                                      PopupMenuItem<PopupmenuItemModel>(
                                          child: popupmenuItemFormate((){},controller.popupMenuItemList[3].icon, controller.popupMenuItemList[3].title!)
                                      ),
                                ],
                              ),
                            ])),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 20.h, top: 24.v, right: 20.h),
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
                                        Text("lbl_674".tr,
                                            style: CustomTextStyles
                                                .titleMedium16_1),
                                        SizedBox(height: 9.v),
                                        Text("lbl_artwork".tr,
                                            style: theme.textTheme.bodyLarge)
                                      ])),
                              GestureDetector(
                                  onTap: () {},
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
                                            Text("lbl_254_k".tr,
                                                style: CustomTextStyles
                                                    .titleMedium16_1),
                                            SizedBox(height: 9.v),
                                            Text("lbl_followers".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ]))),
                              GestureDetector(
                                  onTap: () {},
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
                                            Text("lbl_1258".tr,
                                                style: CustomTextStyles
                                                    .titleMedium16_1),
                                            SizedBox(height: 11.v),
                                            Text("lbl_following".tr,
                                                style:
                                                    theme.textTheme.bodyLarge)
                                          ])))
                            ])),
                    Container(
                      height: 30.v,
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
                          Tab(
                            child: Text(
                              "Created",
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Liked",
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }


  popupmenuItemFormate(function,icon,text){
    return GestureDetector(
      onTap: function,
      child: Row(children: [
        CustomImageView(
            svgPath: icon,
            height: 24.adaptSize,
            width: 24.adaptSize),
        Padding(
            padding:
            EdgeInsets.only(
                left: 12.h,
                top: 2.v),
            child: Text(
                text,
                style: theme
                    .textTheme
                    .bodyLarge))
      ]),
    );
  }


}
