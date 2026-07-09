import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/sign_up_controller.dart';





class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 SignUpController controller = Get.put(SignUpController());

 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
   onWillPop: ()async{
    Get.back();
    return true;
   },
    child: ColorfulSafeArea(
     color: appTheme.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text("lbl_signup2".tr,
                             style: theme.textTheme.displaySmall),
                         Container(
                             width: 328.h,
                             margin: EdgeInsets.only(top: 14.v, right: 45.h),
                             child: Text("msg_please_enter_your2".tr,
                                 maxLines: 2,
                                 overflow: TextOverflow.ellipsis,
                                 style: theme.textTheme.bodyLarge!
                                     .copyWith(height: 1.50))),
                         SizedBox(height: 37.v),
                         CustomTextFormField(
                             controller: controller.firstNameController,
                             hintText: "lbl_first_name".tr,
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                               return "Please enter valid text";
                              }
                              return null;
                             },
                             contentPadding: EdgeInsets.symmetric(
                                 horizontal: 16.h, vertical: 17.v)),
                         SizedBox(height: 20.v),
                         CustomTextFormField(
                             controller: controller.lastNameController,
                             hintText: "lbl_last_name".tr,
                             validator: (value) {
                              if (value == null || value.isEmpty){
                               return "Please enter valid text";
                              }
                              return null;
                             },
                             contentPadding: EdgeInsets.symmetric(
                                 horizontal: 16.h, vertical: 17.v)),
                         SizedBox(height: 24.v),
                         CustomTextFormField(
                             controller: controller.emailController,
                             hintText: "lbl_email_address".tr,
                             textInputType: TextInputType.emailAddress,
                             validator: (value) {
                              if (value == null ||
                                  (!isValidEmail(value, isRequired: true))) {
                               return "Please enter valid email";
                              }
                              return null;
                             },
                             contentPadding: EdgeInsets.symmetric(
                                 horizontal: 16.h, vertical: 17.v)),
                         SizedBox(height: 24.v),
                         Obx(() => CustomTextFormField(
                             controller: controller.passwordController,
                             hintText: "lbl_password".tr,
                             textInputAction: TextInputAction.done,
                             textInputType: TextInputType.visiblePassword,
                             suffix: InkWell(
                                 onTap: () {
                                  controller.isShowPassword.value =
                                  !controller.isShowPassword.value;
                                 },
                                 child: Container(
                                     margin: EdgeInsets.fromLTRB(
                                         30.h, 16.v, 16.h, 16.v),
                                     child: CustomImageView(
                                         svgPath:
                                         controller.isShowPassword.value
                                             ? ImageConstant.imgEyeOff
                                             : ImageConstant.imgEye))),
                             suffixConstraints:
                             BoxConstraints(maxHeight: 56.v),
                             validator: (value) {
                              if (value == null || value.isEmpty) {
                               return "Please enter valid password";
                              }
                              return null;
                             },
                             obscureText: controller.isShowPassword.value,
                             contentPadding: EdgeInsets.only(
                                 left: 16.h, top: 17.v, bottom: 17.v))),
                         SizedBox(height: 40.v),
                         CustomElevatedButton(
                             text: "lbl_signup2".tr,
                             onTap: () {
                              if(_formKey.currentState!.validate()){


                              onTapSignup();}
                             }),
                         Spacer(),
                         SizedBox(height: 8.v),
                         Align(
                             alignment: Alignment.center,
                             child: GestureDetector(
                                 onTap: () {
                                  onTapTxtAlreadyhavean();
                                 },
                                 child: RichText(
                                     text: TextSpan(children: [
                                      TextSpan(
                                          text: "msg_already_have_an2".tr,
                                          style: theme.textTheme.bodyLarge),
                                      TextSpan(
                                          text: "lbl_login".tr,
                                          style: CustomTextStyles
                                              .titleMediumPrimary)
                                     ]),
                                     textAlign: TextAlign.left)))
                        ]))))),
  );
 }


 onTapSignup() {Get.back();
 }

 onTapTxtAlreadyhavean() {
 Get.back();
 }
}


