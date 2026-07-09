import 'package:ai_image_generator/core/app_export.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_search_view.dart';
import '../discover_artwork_page/discover_artwork_page.dart';
import '../discover_page/discover_page.dart';
import 'controller/follower_tab_container_controller.dart';

class FollowersTabContainerScreen extends StatefulWidget {
  const FollowersTabContainerScreen({super.key});

  @override
  State<FollowersTabContainerScreen> createState() => _FollowersTabContainerScreenState();
}

class _FollowersTabContainerScreenState extends State<FollowersTabContainerScreen> {
  FollowersTabContainerController followersTabContainerController = Get.put(FollowersTabContainerController());

  List tabs = [ DiscoverPage(),
    DiscoverPage(),];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: ColorfulSafeArea(child: GetBuilder<FollowersTabContainerController>(
        init: FollowersTabContainerController(),
        builder:(controller) =>  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          getCommonAppBar("Profile"),
          Align(
            alignment: Alignment.center,
            child: CustomSearchView(
              margin: EdgeInsets.only(
                left: 20.h,
                top: 16.v,
                right: 20.h,
              ),
              controller: controller.searchController,
              hintText: "lbl_search".tr,
              alignment: Alignment.center,
              prefix: Container(
                margin: EdgeInsets.fromLTRB(16.h, 12.v, 12.h, 12.v),
                child: CustomImageView(
                  svgPath: ImageConstant.imgSearchBlack900,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 48.v,
              ),
              suffix: Padding(
                padding: EdgeInsets.only(
                  right: 15.h,
                ),
                child: IconButton(
                  onPressed: () {
                    controller.searchController.clear();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 30.v,
            width: 174.h,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 25.v,
            ),
            child: TabBar(
              controller: controller.tabviewController,
              labelPadding: EdgeInsets.zero,
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
              indicatorPadding: EdgeInsets.only(right: 41.h,left: 5.h),
              indicatorWeight: 3.h,
              indicatorColor: appTheme.blue,
              tabs: [
                Tab(
                  child: Text(
                    "Followers",
                  ),
                ),
                Tab(
                  child: Text(
                    "Following",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.v,),
          Expanded(
            child: SizedBox(
              child: TabBarView(
                controller: controller.tabviewController,
                children: [
                  DiscoverPage(),
                  DiscoverArtworkPage(),
                ],
              ),
            ),
          ),
        ],),
      )),
    ), onWillPop: ()async {
      Get.back();
      return true;
    },);
  }
}
