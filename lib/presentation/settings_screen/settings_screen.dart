import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/log_out_popup_screen/log_out_popup_screen.dart';
import 'package:ai_image_generator/widgets/custom_icon_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/settings_controller.dart';




class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
 SettingsController controller = Get.put(SettingsController());
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
                 getCommonAppBar("lbl_settings".tr),
                 SizedBox(height: 16.v),
                 Expanded(
                     child: SingleChildScrollView(
                         child: Padding(
                             padding: EdgeInsets.only(
                                 left: 20.h, right: 20.h, bottom: 5.v),
                             child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.toNamed(AppRoutes.upgradeScreen);
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.h, vertical: 14.v),
                                        decoration: AppDecoration.blue.copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8),
                                        child: Row(children: [
                                         CustomIconButton(
                                             height: 68.adaptSize,
                                             width: 68.adaptSize,
                                             margin: EdgeInsets.symmetric(
                                                 vertical: 1.v),
                                             padding: EdgeInsets.all(18.h),
                                             decoration: IconButtonStyleHelper
                                                 .fillOnErrorContainerTL34,
                                             child: CustomImageView(
                                                 svgPath: ImageConstant
                                                     .imgCrown11)),
                                         Padding(
                                             padding: EdgeInsets.only(
                                                 left: 16.h, top: 4.v),
                                             child: Column(
                                                 crossAxisAlignment:
                                                 CrossAxisAlignment.start,
                                                 children: [
                                                  Text(
                                                      "lbl_upgrade_to_pro".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumOnErrorContainer16),
                                                  SizedBox(height: 5.v),
                                                  SizedBox(
                                                      width: 219.h,
                                                      child: Text(
                                                          "msg_enjoy_all_features"
                                                              .tr,
                                                          maxLines: 2,
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          style: CustomTextStyles
                                                              .bodyMediumOnErrorContainer
                                                              .copyWith(
                                                              height:
                                                              1.50)))
                                                 ]))
                                        ])),
                                  ),
                                  SizedBox(height: 26.v),
                                  Text("lbl_general".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 18.v),

                                   profileOptionFormate(ImageConstant.imgIcprofile, "lbl_personal_info".tr, (){
                                     Get.toNamed(AppRoutes.personalInformationScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgSave, "lbl_payment_methods".tr, (){
                                     Get.toNamed(AppRoutes.paymentMethodScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgIcnotificatuion, "lbl_notifications".tr, (){
                                     Get.toNamed(AppRoutes.notificationsOneScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgSequrityIcon, "lbl_security".tr, (){
                                     Get.toNamed(AppRoutes.securityScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgIclanguage, "lbl_language".tr, (){
                                     Get.toNamed(AppRoutes.languageScreen);
                                   }),
                                  SizedBox(height: 10.v),
                                  Text("lbl_about".tr,
                                      style: theme.textTheme.titleMedium),
                                  SizedBox(height: 18.v),
                                   profileOptionFormate(ImageConstant.imgFile, "msg_follow_us_on_social".tr, (){
                                     Get.toNamed(AppRoutes.socialMediaScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgLock, "lbl_privacy_policy".tr, (){
                                     Get.toNamed(AppRoutes.privacyPolicyScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgInfo, "lbl_about_us".tr, (){
                                     Get.toNamed(AppRoutes.aboutUsScreen);
                                   }),
                                   profileOptionFormate(ImageConstant.imgArrowrightBlack900, "lbl_logout".tr, (){
                                     showDialog(
                                       barrierDismissible: false,
                                       context: context,
                                       builder: (context) {
                                         return AlertDialog(
                                             insetPadding: EdgeInsets.all(16),
                                             shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.circular(20)),
                                             contentPadding: EdgeInsets.zero,
                                             content:

                                             LogOutPopupScreen());
                                       },
                                     );
                                   }),

                                 ]))))
                ])),
          ),
         ));
 }

 onTapRowarrowright() {
  Get.toNamed(
   AppRoutes.logOutPopupScreen,
  );
 }

 onTapArrowleftone() {
  Get.back();
 }

 profileOptionFormate(icon,title,function){
   return  Padding(
     padding:  EdgeInsets.symmetric(vertical: 8.v),
     child: GestureDetector(
       onTap: function,
       child: Container(
           padding: EdgeInsets.symmetric(
               horizontal: 16.h, vertical: 12.v),
           decoration: AppDecoration.fillGray10002
               .copyWith(
               borderRadius: BorderRadiusStyle
                   .roundedBorder8),
           child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
            Row(
              children: [
                CustomImageView(
                    svgPath:
                    icon,
                    height: 24.adaptSize,
                    width: 24.adaptSize),
                Padding(
                    padding: EdgeInsets.only(
                        left: 12.h, top: 2.v),
                    child: Text(
                        title,
                        style: theme
                            .textTheme.bodyMedium)),
              ],
            ),
             CustomImageView(
                 svgPath:
                 ImageConstant.imgArrowright,
                 height: 20.adaptSize,
                 width: 20.adaptSize)
           ])),
     ),
   );
 }
}








