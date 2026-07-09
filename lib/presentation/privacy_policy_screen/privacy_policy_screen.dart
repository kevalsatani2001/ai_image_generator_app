import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_14.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/privacy_policy_controller.dart';



class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
 PrivacyPolicyController controller = Get.put(PrivacyPolicyController());
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
                getCommonAppBar("Privacy policy"),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 28.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Text("msg_types_of_data_we".tr,
                              style: theme.textTheme.titleMedium),
                          Container(
                              width: 363.h,
                              margin: EdgeInsets.only(top: 9.v, right: 10.h),
                              child: Text("msg_torem_ipsum_dolor".tr,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(height: 1.50))),
                          SizedBox(height: 27.v),
                          Text("msg_use_of_your_personal".tr,
                              style: theme.textTheme.titleMedium),
                          Container(
                              width: 363.h,
                              margin: EdgeInsets.only(top: 9.v, right: 10.h),
                              child: RichText(
                                  text: TextSpan(children: [
                                   TextSpan(
                                       text: "lbl_t".tr,
                                       style: theme.textTheme.bodyMedium),
                                   TextSpan(
                                       text: "msg_orem_ipsum_dolor".tr,
                                       style: theme.textTheme.bodyMedium)
                                  ]),
                                  textAlign: TextAlign.left)),
                          SizedBox(height: 27.v),
                          Text("msg_disclosure_of_your".tr,
                              style: theme.textTheme.titleMedium),
                          SizedBox(height: 9.v),
                          SizedBox(
                              width: 372.h,
                              child: Text("msg_lorem_ipsum_dolor".tr,
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyMedium!
                                      .copyWith(height: 1.50))),
                          SizedBox(height: 5.v)
                         ]))
                ])),
          )));
 }

 onTapPrivacypolicy() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}




