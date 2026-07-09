import '../discover_creator_screen/widgets/userprofile_item_widget.dart';
import 'controller/discover_creator_controller.dart';
import 'models/userprofile_item_model.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DiscoverCreatorScreen extends GetWidget<DiscoverCreatorController> {
  const DiscoverCreatorScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 17.v,
                ),
                decoration: AppDecoration.outlineGray,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6.v),
                    Text(
                      "lbl_discover".tr,
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              CustomSearchView(
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 8.v,
                  right: 20.h,
                ),
                controller: controller.searchController,
                hintText: "lbl_cartoon".tr,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    top: 25.v,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_creator".tr,
                            style: CustomTextStyles.titleMediumPrimary16,
                          ),
                          SizedBox(height: 4.v),
                          Container(
                            height: 3.v,
                            width: 36.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(
                                1.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 24.h,
                          bottom: 8.v,
                        ),
                        child: Text(
                          "lbl_artwork".tr,
                          style: CustomTextStyles.bodyLargeGray700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    top: 16.v,
                    right: 20.h,
                  ),
                  child: Obx(
                    () => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 209.v,
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 20.h,
                      ),
                      physics: BouncingScrollPhysics(),
                      itemCount: controller.discoverCreatorModelObj.value
                          .userprofileItemList.value.length,
                      itemBuilder: (context, index) {
                        UserprofileItemModel model = controller
                            .discoverCreatorModelObj
                            .value
                            .userprofileItemList
                            .value[index];
                        return UserprofileItemWidget(
                          model,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
