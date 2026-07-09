import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.put(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: ()async{
        closeApp();
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
                            Text("lbl_login".tr,
                                style: theme.textTheme.displaySmall),
                            Container(
                                width: 354.h,
                                margin: EdgeInsets.only(top: 14.v, right: 19.h),
                                child: Text("msg_please_enter_your".tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyLarge!
                                        .copyWith(height: 1.50))),
                            SizedBox(height: 37.v),
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
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtForgotpassword();
                                    },
                                    child: Text("msg_forgot_password".tr,
                                        style: theme.textTheme.bodyLarge))),
                            SizedBox(height: 39.v),
                            CustomElevatedButton(
                                text: "lbl_login".tr,
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    PrefUtils.setIsSignIn(false);
                                    onTapLogin();
                                  }
                                }),
                            Spacer(),
                            SizedBox(height: 8.v),
                            Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtDonthaveanaccount();
                                    },
                                    child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "msg_don_t_have_an_account2".tr,
                                              style: theme.textTheme.bodyLarge),
                                          TextSpan(
                                              text: "lbl_sign_up".tr,
                                              style: CustomTextStyles
                                                  .titleMediumPrimary)
                                        ]),
                                        textAlign: TextAlign.left)))
                          ]))))),
    );
  }

  onTapTxtForgotpassword() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapLogin() {
    Get.toNamed(
      AppRoutes.homeScreenOneContainerScreen,
    );
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(
      AppRoutes.signUpScreen,
    );
  }
}
