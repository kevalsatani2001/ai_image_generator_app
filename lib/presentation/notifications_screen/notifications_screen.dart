import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_8.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../notifications_screen/widgets/usernotificatio_item_widget.dart';
import 'controller/notifications_controller.dart';
import 'models/usernotificatio_item_model.dart';



class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
 NotificationsController controller = Get.put(NotificationsController());

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
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                getCommonAppBar("lbl_notifications".tr),
                 Expanded(
                     child: SizedBox(
                         width: double.maxFinite,
                         child: Container(
                             padding: EdgeInsets.symmetric(horizontal: 20.h),
                             child: Column(children: [
                              SizedBox(height: 16.v),
                              Expanded(
                                  child: Obx(() => ListView.separated(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) {
                                       return SizedBox(height: 16.v);
                                      },
                                      itemCount: controller
                                          .notificationsModelObj
                                          .value
                                          .usernotificatioItemList
                                          .value
                                          .length,
                                      itemBuilder: (context, index) {
                                       UsernotificatioItemModel model =
                                       controller
                                           .notificationsModelObj
                                           .value
                                           .usernotificatioItemList
                                           .value[index];
                                       return UsernotificatioItemWidget(
                                           model);
                                      }))),
                              Container(
                                  height: 64.v,
                                  width: 374.h,
                                  decoration: BoxDecoration(
                                      color: appTheme.gray10002,
                                      borderRadius:
                                      BorderRadius.circular(8.h)))
                             ]))))
                ])),
          )));
 }

 onTapNotifications() {
  Get.toNamed(
   AppRoutes.homeScreenOneContainerScreen,
  );
 }
}

