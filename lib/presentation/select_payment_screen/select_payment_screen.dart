import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_2.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_radio_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../payment_method_screen/models/payment_method_model.dart';
import 'controller/select_payment_controller.dart';





class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
 SelectPaymentController selectPaymentController = Get.put(SelectPaymentController());
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
            child: GetBuilder<SelectPaymentController>(
              init: SelectPaymentController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                  getCommonAppBar("Select payment"),

                    ListView.builder(

padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 16.v),
                      primary: false,
                      shrinkWrap: true,
                      itemCount: controller.paymentMethodsList.length,
                      itemBuilder: (context, index) {
                        PaymentMethodModel data = controller.paymentMethodsList[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.v),
                          child: GestureDetector(
                            onTap: (){
                              controller.currentPaymentMethos = data.id!;
                              controller.update();
                            },
                            child: Container(
                              decoration: AppDecoration.fillGray10002.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder8),
                              child: Padding(
                                padding:  EdgeInsets.all(8.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Row(
                                     children: [
                                       Container(
                                           padding: EdgeInsets.all(12.h),
                                           decoration: BoxDecoration(
                                               color: theme.colorScheme.onErrorContainer,
                                               borderRadius: BorderRadius.circular(8.h)),
                                           child: CustomImageView(
                                               svgPath: data.icon)),
                                       SizedBox(width: 16.h,),
                                       Text(data.title!,style:CustomTextStyles.titleMedium16_1)
                                     ],
                                   ),
                                    Padding(
                                      padding:  EdgeInsets.only(right: 16.h),
                                      child: CustomImageView(
                                        svgPath: controller.currentPaymentMethos == data.id?ImageConstant.imgRadioSelected:ImageConstant.imgRadiounSelected,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },)

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
   AppRoutes.reviewSummaryScreen,
  );
 }

 onTapSelectpayment() {
  Get.toNamed(
   AppRoutes.chooseYourPlanScreen,
  );
 }
}




