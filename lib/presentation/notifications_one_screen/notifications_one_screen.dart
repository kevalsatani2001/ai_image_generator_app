import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_switch.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/notifications_one_controller.dart';
import 'models/notifications_one_model.dart';



class NotificationsOneScreen extends StatefulWidget {
  const NotificationsOneScreen({super.key});

  @override
  State<NotificationsOneScreen> createState() => _NotificationsOneScreenState();
}

class _NotificationsOneScreenState extends State<NotificationsOneScreen> {
 NotificationsOneController notificationsOneController = Get.put(NotificationsOneController());
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
                GetBuilder<NotificationsOneController>(
                  init: NotificationsOneController(),
                  builder: (controller) => Expanded(
                    child: ListView(
                      children: [
                                Container(
                          padding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 28.v),
                          child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 Text("msg_notify_me_when".tr,
                                     style: theme.textTheme.titleMedium),
                                 SizedBox(height: 8.v),
                                 ListView.builder(
                                   primary: false,
                                   shrinkWrap: true,
                                   itemCount: controller.notifymeList.length,
                                   itemBuilder: (context, index) {
                                     NotificationsOneModel data = controller.notifymeList[index];
                                   return Padding(
                                     padding:  EdgeInsets.symmetric(vertical: 8.v),
                                     child: Container(
                                         decoration: AppDecoration.fillGray10002
                                             .copyWith(
                                             borderRadius:
                                             BorderRadiusStyle.roundedBorder8),
                                       child: Padding(
                                         padding:  EdgeInsets.only(top: 12.v,bottom: 12.v,left: 16.h),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           children: [
                                             Text(
                                                data.title!,
                                                 style:
                                                 theme.textTheme.bodyMedium),
                                             CustomImageView(
                                               onTap: () {
                                                 data.isOn = !data.isOn!;
                                                 controller.update();
                                               },
                                               height: 31.adaptSize,
                                               width: 51.adaptSize,
                                               svgPath:  data.isOn!?ImageConstant.imgswitchOn:ImageConstant.imgswitchOff
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   );
                                 },),
                                 SizedBox(height: 24.v),
                                 Text("lbl_system".tr,
                                     style: theme.textTheme.titleMedium),
                                  SizedBox(height: 8.v),
                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: controller.systemList.length,
                                    itemBuilder: (context, index) {
                                      NotificationsOneModel data = controller.systemList[index];
                                      return Padding(
                                        padding:  EdgeInsets.symmetric(vertical: 8.v),
                                        child: Container(
                                          decoration: AppDecoration.fillGray10002
                                              .copyWith(
                                              borderRadius:
                                              BorderRadiusStyle.roundedBorder8),
                                          child: Padding(
                                            padding:  EdgeInsets.only(top: 12.v,bottom: 12.v,left: 16.h),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                    data.title!,
                                                    style:
                                                    theme.textTheme.bodyMedium),
                                                CustomImageView(
                                                  onTap: () {
                                                    data.isOn = !data.isOn!;
                                                    controller.update();
                                                  },
                                                  height: 31.adaptSize,
                                                  width: 51.adaptSize,
                                                  svgPath:  data.isOn!?ImageConstant.imgswitchOn:ImageConstant.imgswitchOff
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },),
                                ])),
                              ],
                    ),
                  ),
                )
               ])),
          ),
         ));
 }

 onTapNotifications() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}




