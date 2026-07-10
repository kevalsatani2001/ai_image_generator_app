import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/upgrade_controller.dart';
import 'models/upgrade_model.dart';



class UpgradeScreen extends StatefulWidget {
  const UpgradeScreen({super.key});

  @override
  State<UpgradeScreen> createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
 UpgradeController controller = Get.put(UpgradeController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return Scaffold(
      body: ColorfulSafeArea(
       color: appTheme.white,
        child: SizedBox(
            width: double.maxFinite,
            child: Column(children: [
           getCommonAppBar("lbl_upgrade".tr),
             Expanded(
               child: ListView(
                 children: [
                           Container(
                     margin:
                     EdgeInsets.only(left: 20.h, top: 16.v, right: 20.h),
                     decoration: AppDecoration.fillGray10002.copyWith(
                           borderRadius: BorderRadiusStyle.customBorderTL8),
                     child: Column(
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 48.h, vertical: 21.v),
                                decoration: AppDecoration.blue.copyWith(
                                    borderRadius:
                                    BorderRadiusStyle.customBorderTL8),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                     SizedBox(height: 7.v),
                                     Text("lbl_upgrade_to_pro".tr,
                                         style: CustomTextStyles
                                             .titleMediumOnErrorContainer_1),
                                     SizedBox(height: 9.v),
                                     SizedBox(
                                         width: 275.h,
                                         child: Text(
                                             "msg_enjoy_all_features".tr,
                                             maxLines: 2,
                                             overflow: TextOverflow.ellipsis,
                                             textAlign: TextAlign.center,
                                             style: CustomTextStyles
                                                 .bodyLargeOnErrorContainer
                                                 .copyWith(height: 1.50)))
                                    ])),
                            ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 8.v),
                              primary: false,
                              shrinkWrap: true,
                              itemCount: controller.planFeaturesList.length,
                              itemBuilder: (context, index) {
                                UpgradeModel data = controller.planFeaturesList[index];
                              return Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 16.h,vertical: 8.v),
                                child: Row(
                                  children: [
                                    CustomImageView(svgPath: ImageConstant.imgCheakmarkCirculerIcon,),
                                    SizedBox(width: 12.h),
                                    Text(data.title!,style: theme.textTheme.bodyLarge,),
                                  ],
                                ),
                              );
                            },),

                           ])),
                         ],
               ),
             )
            ])),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
          decoration: AppDecoration.white,
          child: CustomElevatedButton(
              text: "lbl_upgrade_to_pro".tr,
              onTap: () {
               onTapUpgradetopro();
              })));
 }
 onTapUpgradetopro() {
  Get.toNamed(
   AppRoutes.chooseYourPlanScreen,
  );
 }


 onTapUpgrade() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}



