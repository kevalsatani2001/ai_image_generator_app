import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/discover_artwork_page/discover_artwork_page.dart';
import 'package:ai_image_generator/presentation/home_screen/home_screen.dart';
import 'package:ai_image_generator/presentation/home_screen_one_page/home_screen_one_page.dart';
import 'package:ai_image_generator/presentation/profile_one_page/profile_one_page.dart';
import 'package:ai_image_generator/presentation/profile_one_tab_container_screen/profile_one_tab_container_screen.dart';
import 'package:ai_image_generator/presentation/profile_tab_container_page/profile_tab_container_page.dart';
import 'package:ai_image_generator/presentation/toolbox_ai_page/toolbox_ai_page.dart';
import 'package:ai_image_generator/widgets/custom_bottom_bar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_outlined_button.dart';
import '../discover_tab_container_page/discover_tab_container_page.dart';
import '../profile_page/profile_page.dart';
import 'controller/home_screen_one_container_controller.dart';




class HomeScreenOneContainerScreen extends StatefulWidget {
  const HomeScreenOneContainerScreen({super.key});

  @override
  State<HomeScreenOneContainerScreen> createState() => _HomeScreenOneContainerScreenState();
}

class _HomeScreenOneContainerScreenState extends State<HomeScreenOneContainerScreen> {
 HomeScreenOneContainerController controller = Get.put(HomeScreenOneContainerController());
 List<Widget> screen = [
  HomeScreen(isNavigateHomeTab: false),
  ToolboxAiPage(),
   DiscoverTabContainerPage(),
   // DiscoverArtworkPage(),
  ProfileTabContainerPage()
 ];
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return  GetBuilder<CustomBottomBarController>(
   init: CustomBottomBarController(),
   builder: (controller) => WillPopScope(
    onWillPop: () async {
     if (controller.selectedIndex == 0) {
      showDialog(
       barrierDismissible: false,
       context: context,
       builder: (context) {
        return AlertDialog(
            insetPadding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            contentPadding: EdgeInsets.zero,
            content: Container(
                width: 374.h,
                padding: EdgeInsets.all(30.h),
                decoration: AppDecoration.white.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text(
                         "Are you sure want to exit?".tr,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         textAlign: TextAlign.center,
                         style: theme.textTheme.titleMedium
                     ),
                     Padding(
                         padding: EdgeInsets.only(top: 32.v),
                         child: Row(
                             mainAxisAlignment:
                             MainAxisAlignment.center,
                             children: [
                              Expanded(
                                  child:CustomOutlinedButton(
                         text: "No",
                             margin:
                             EdgeInsets.only(right: 10.h),
                             onTap: () {
                               Get.back();
                             })
            ),
                              Expanded(
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      if (controller
                                          .selectedIndex ==
                                          0) {
                                        closeApp();
                                      } else {
                                        controller.getIndex(0);
                                        Get.back();
                                      }
                                    },
                                      text: "Yes",
                                      margin:
                                      EdgeInsets.only(left: 10.h))

            ),
                             ]))
                    ])));
       },
      );
     } else {
      controller.getIndex(0);
      // Get.back();
     }
     return false;
    },
    child: ColorfulSafeArea(
        color: appTheme.white,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: appTheme.white,
            body: screen[controller.selectedIndex],
            bottomNavigationBar:
            CustomBottomBar(onChanged: (BottomBarEnum type) {
             Get.toNamed(getCurrentRoute(type), id: 1);
            }))),
   ),
  );
 }
 ///Handling route based on bottom click actions
 String getCurrentRoute(BottomBarEnum type) {
  switch (type) {
   case BottomBarEnum.Home:
    return AppRoutes.homeScreenOnePage;
   default:
    return "/";
  }
 }

 ///Handling page based on route
 Widget getCurrentPage(String currentRoute) {
  switch (currentRoute) {
   case AppRoutes.homeScreenOnePage:
    return HomeScreenOnePage();
   default:
    return DefaultWidget();
  }
 }
}





