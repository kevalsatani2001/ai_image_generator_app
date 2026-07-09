import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/forgot_password_controller.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
 ForgotPasswordController controller = Get.put(ForgotPasswordController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: ()async{
    Get.back();
    return true;
   },
    child: ColorfulSafeArea(
        color: appTheme.white, child:Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
            key: _formKey,
            child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [

                  getCommonAppBar("lbl_forgot_password".tr),
                 Container(
                     padding: EdgeInsets.symmetric(
                         horizontal: 20.h, vertical: 17.v),
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          Container(
                              width: 330.h,
                              margin: EdgeInsets.only(right: 43.h),
                              child: Text("msg_please_enter_your3".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(height: 1.50))),
                          SizedBox(height: 37.v),
                          CustomTextFormField(
                              controller: controller.emailController,
                              hintText: "lbl_email_address".tr,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                               if (value == null ||
                                   (!isValidEmail(value,
                                       isRequired: true))) {
                                return "Please enter valid email";
                               }
                               return null;
                              },
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 17.v)),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                              text: "lbl_continue".tr,
                              onTap: () {
                               if(_formKey.currentState!.validate()){
                               onTapContinue();}
                              }),
                          SizedBox(height: 5.v)
                         ]))
                ]))))),
  );
 }

 onTapForgotpassword() {
  Get.toNamed(
   AppRoutes.loginScreen,
  );
 }


 onTapContinue() {
  Get.toNamed(
   AppRoutes.verificationScreen,
  );
 }
}




