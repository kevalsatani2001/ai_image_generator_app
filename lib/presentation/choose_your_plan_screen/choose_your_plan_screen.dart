import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../choose_your_plan_screen/widgets/subscriptionpla_item_widget.dart';
import 'controller/choose_your_plan_controller.dart';
import 'models/subscriptionpla_item_model.dart';



class ChooseYourPlanScreen extends StatefulWidget {
  const ChooseYourPlanScreen({super.key});

  @override
  State<ChooseYourPlanScreen> createState() => _ChooseYourPlanScreenState();
}

class _ChooseYourPlanScreenState extends State<ChooseYourPlanScreen> {
 ChooseYourPlanController chooseYourPlanController = Get.put(ChooseYourPlanController());
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
            child: GetBuilder<ChooseYourPlanController>(
              init: ChooseYourPlanController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                  getCommonAppBar("Choose your plan"),
                   Expanded(
                       child: ListView.separated(
                         padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 24.v),
                         primary: false,
                           physics: BouncingScrollPhysics(),
                           shrinkWrap: true,
                           separatorBuilder: (context, index) {
                             return SizedBox(height: 16.v);
                           },
                           itemCount: controller.planList.length,
                           itemBuilder: (context, index) {
                             SubscriptionplaItemModel model = controller
                                 .planList[index];
                             return SubscriptionplaItemWidget(model);
                           }))
                  ])),
            ),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
                  text: "lbl_continue".tr,
                  onTap: () {
                   onTapContinue();
                  }))));
 }

 onTapContinue() {
  Get.toNamed(
   AppRoutes.selectPaymentScreen,
  );
 }

 onTapChooseyour() {
  Get.toNamed(
   AppRoutes.upgradeScreen,
  );
 }
}


