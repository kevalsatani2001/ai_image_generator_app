import 'controller/discover_tab_container_controller.dart';
import 'models/discover_tab_container_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/discover_artwork_page/discover_artwork_page.dart';
import 'package:ai_image_generator/presentation/discover_page/discover_page.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class DiscoverTabContainerPage extends StatefulWidget {
  DiscoverTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<DiscoverTabContainerPage> createState() => _DiscoverTabContainerPageState();
}

class _DiscoverTabContainerPageState extends State<DiscoverTabContainerPage> {
  DiscoverTabContainerController controller =
      Get.put(DiscoverTabContainerController(DiscoverTabContainerModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 0.h,
            vertical: 17.v,
          ),
          decoration: AppDecoration.outlineGray10001,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.v),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  "lbl_discover".tr,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
            ],
          ),
        ),
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
          width: 146.h,
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
            indicatorPadding: EdgeInsets.only(right: 25.h,left: 5.h),
            indicatorWeight: 3.h,
            indicatorColor: appTheme.blue,
            tabs: [
              Tab(
                child: Text(
                  "lbl_creator".tr,
                ),
              ),
              Tab(
                child: Text(
                  "lbl_artwork".tr,
                ),
              ),
            ],
          ),
        ),
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
      ],
    );
  }
}
