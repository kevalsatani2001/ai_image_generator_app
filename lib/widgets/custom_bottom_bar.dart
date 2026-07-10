import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    this.onChanged,
  }) : super(
          key: key,
        );

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavhome,
      activeIcon: ImageConstant.imgNavhomeSelected,
      title: "lbl_home".tr,
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSettings,
      activeIcon: ImageConstant.imgSettingsSelected,
      title: "Toolbox AI",
      type: BottomBarEnum.Toolbox,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgVolumeGray700,
      activeIcon: ImageConstant.imgVolumeGray700Selected,
      title: "Discover",
      type: BottomBarEnum.Discover,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgUser,
      activeIcon: ImageConstant.imgUserSelected,
      title: "Profile",
      type: BottomBarEnum.Profile,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomBarController>(
      init: CustomBottomBarController(),
      builder:(controller) =>  BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: controller.selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 38.v,
                  width: 38.v,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(9.h),
                    child: CustomImageView(
                      svgPath: bottomMenuList[index].icon,
                      // color: ColorConstant.indigo800,
                    ),
                  ),),
                Padding(
                  padding:  EdgeInsets.only(
                    top: 3.v,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            activeIcon:





            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [


                Container(
                  height: 38.v,
                  width: 38.v,
                  decoration: BoxDecoration(
                      color: appTheme.gray200,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: EdgeInsets.all(9.h),
                    child: CustomImageView(
                      svgPath: bottomMenuList[index].activeIcon,

                    ),
                  ),),
                Padding(
                  padding: EdgeInsets.only(
                    top: 3.v,
                  ),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: CustomTextStyles.bodyMediumPrimary.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          controller.getIndex(index);
        },
      ),
    );






  }
}

enum BottomBarEnum {
  Home,
  Toolbox,
  Discover,
  Profile


}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBottomBarController extends GetxController{
  int selectedIndex = 0;
  getIndex(int index){
    selectedIndex = index;
    update();
  }}

