import 'package:ai_image_generator/core/app_export.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/security_controller.dart';
import 'models/security_model.dart';



class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
 SecurityController controller = Get.put(SecurityController());
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
               getCommonAppBar("Security"),
                 GetBuilder<SecurityController>(
                   init: SecurityController(),
                   builder:(controller) =>  Container(
                       padding: EdgeInsets.symmetric(
                           horizontal: 20.h, vertical: 24.v),
                       child: Column(children: [
                         ListView.builder(
                           primary: false,
                           shrinkWrap: true,
                           itemCount: controller.sequrityData.length,
                           itemBuilder: (context, index) {
                             SecurityModel data = controller.sequrityData[index];
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
                        SizedBox(height: 16.v),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 14.v),
                            decoration: AppDecoration.fillGray10002.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                 Padding(
                                     padding: EdgeInsets.only(top: 4.v),
                                     child: Text("msg_device_management".tr,
                                         style: theme.textTheme.bodyMedium)),
                                 CustomImageView(
                                     svgPath: ImageConstant.imgArrowright,
                                     height: 20.adaptSize,
                                     width: 20.adaptSize,
                                     margin:
                                     EdgeInsets.symmetric(vertical: 2.v))
                                ])),
                        SizedBox(height: 5.v)
                       ])),
                 )
                ])),
          )));
 }

 onTapSecurity() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}





