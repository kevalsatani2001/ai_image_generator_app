import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_9.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/payment_method_controller.dart';
import 'models/payment_method_model.dart';





class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
 PaymentMethodController controller = Get.put(PaymentMethodController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
      onWillPop: () async{
       Get.back();
       return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ColorfulSafeArea(
           color: appTheme.white,
           child: SizedBox(
               width: double.maxFinite,
               child: Column(children: [
               getCommonAppBar("Payment method"),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.h, vertical: 24.v),
                    child: Column(children: [
                      ListView.builder(


primary: false,
                        shrinkWrap: true,
                        itemCount: controller.paymentMethodsList.length,
                        itemBuilder: (context, index) {
                          PaymentMethodModel data = controller.paymentMethodsList[index];
                        return Padding(
                          padding:  EdgeInsets.symmetric(vertical: 8.v),
                          child: Container(
                            decoration: AppDecoration.fillGray10002.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8),
                            child: Padding(
                              padding:  EdgeInsets.all(8.h),
                              child: Row(
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
                            ),
                          ),
                        );
                      },)


                    ]))
               ])),
          ),
          bottomNavigationBar: Container(
              margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              decoration: AppDecoration.white,
              child: CustomElevatedButton(
                  text: "lbl_add_new_card".tr,
                  onTap: () {
                   onTapAddnewcard();
                  }))));
 }

 onTapAddnewcard() {
  Get.toNamed(
   AppRoutes.addNewCardScreen,
  );
 }

 onTapPaymentmethod() {
  Get.toNamed(
   AppRoutes.settingsScreen,
  );
 }
}




