import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';
import 'controller/about_us_controller.dart';



class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
 AboutUsController aboutUsController = Get.put(AboutUsController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
      onWillPop: () async{
       Get.back();
       return true;
      },
      child: Scaffold(
          body: GetBuilder<AboutUsController>(
           init: AboutUsController(),
           builder:(controller) =>  SizedBox(
               width: double.maxFinite,
               child: Column(children: [
                getCommonAppBar("About us"),
                SizedBox(height: 24.v),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 CustomImageView(
                                     imagePath:
                                     ImageConstant.imgRectangle791,
                                     height: 158.v,
                                     width: 374.h,
                                     radius: BorderRadius.circular(8.h)),
                                 SizedBox(height: 18.v),
                                 Text("msg_how_can_i_generate".tr,
                                     style:
                                     CustomTextStyles.titleMedium16_1),
                                 Container(
                                     width: 368.h,
                                     margin: EdgeInsets.only(
                                         top: 16.v, right: 5.h),
                                     child: Text("msg_how_do_ai_image".tr,
                                         maxLines: 5,
                                         overflow: TextOverflow.ellipsis,
                                         style: theme.textTheme.bodyMedium!
                                             .copyWith(height: 1.50))),
                                 SizedBox(height: 18.v),
                                 SizedBox(
                                     width: 372.h,
                                     child: Text("msg_lorem_ipsum_dolor".tr,
                                         maxLines: 10,
                                         overflow: TextOverflow.ellipsis,
                                         style: theme.textTheme.bodyMedium!
                                             .copyWith(height: 1.50))),
                                 Container(
                                     width: 350.h,
                                     margin: EdgeInsets.only(
                                         top: 15.v, right: 23.h),
                                     child: Text(
                                         "msg_consectetur_adipiscing".tr,
                                         maxLines: 6,
                                         overflow: TextOverflow.ellipsis,
                                         style: theme.textTheme.bodyMedium!
                                             .copyWith(height: 1.50))),
                                 Container(
                                     width: 350.h,
                                     margin: EdgeInsets.only(
                                         top: 15.v, right: 23.h),
                                     child: Text(
                                         "msg_consectetur_adipiscing".tr,
                                         maxLines: 1,
                                         overflow: TextOverflow.ellipsis,
                                         style: theme.textTheme.bodyMedium!
                                             .copyWith(height: 1.50)))
                                ]))))
               ])),
          )));
 }

 onTapAboutus() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}


