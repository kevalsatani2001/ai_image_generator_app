import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'controller/verification_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
        color: appTheme.whiteA700,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    getCommonAppBar("lbl_verification".tr),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 18.h, vertical: 17.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 273.h,
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_please_enter_the2".tr,
                                            style: theme.textTheme.bodyLarge),
                                        TextSpan(
                                            text: "msg_john123_gmail_com".tr,
                                            style: CustomTextStyles.titleMedium16)
                                      ]),
                                      textAlign: TextAlign.left)),

                              SizedBox(height: 40.v),
                              Obx(
                                () => Pinput(
                                  errorTextStyle: CustomTextStyles.bodyErrorStyle,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  disabledPinTheme: PinTheme(
                                      padding:
                                          EdgeInsets.only(left: 9.h, right: 9.h),
                                      decoration:
                                          BoxDecoration(color: Colors.red)),
                                  controller: controller.otpController.value,
                                  length: 6,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter valid code";
                                    }
                                    return null;
                                  },
                                  errorPinTheme: PinTheme(
                                    padding: EdgeInsets.only(
                                        left: 8.5.h, right: 8.5.h),
                                    decoration: BoxDecoration(
                                      color: appTheme.whiteA700,
                                      border:
                                          Border.all(color: appTheme.red60001),
                                      borderRadius: BorderRadius.circular(
                                        8.h,
                                      ),
                                    ),
                                    textStyle: CustomTextStyles.bodyErrorStyle,
                                    width: 48.h,
                                    height: 48.h,
                                  ),
                                  defaultPinTheme: PinTheme(
                                    padding: EdgeInsets.only(
                                        left: 8.5.h, right: 8.5.h),
                                    width: 48.h,
                                    height: 48.h,
                                    textStyle: CustomTextStyles.bodyStyle24Black,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: appTheme.gray30),
                                      borderRadius: BorderRadius.circular(
                                        8.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // Obx(() => CustomPinCodeTextField(
                              //     context: context,
                              //     margin: EdgeInsets.only(
                              //         left: 1.h, top: 37.v, right: 2.h),
                              //     controller: controller.otpController.value,
                              //     onChanged: (value) {})),
                              Padding(
                                  padding: EdgeInsets.only(left: 1.h, top: 42.v),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_didn_t_get_code2".tr,
                                            style: CustomTextStyles
                                                .bodyLargeGray700_1),
                                        TextSpan(
                                            text: "lbl_resend_otp".tr,
                                            style: CustomTextStyles
                                                .titleMediumPrimary)
                                      ]),
                                      textAlign: TextAlign.left)),
                              CustomElevatedButton(
                                  text: "lbl_verify".tr,
                                  margin: EdgeInsets.only(
                                      left: 1.h, top: 39.v, bottom: 5.v),
                                  onTap: () {
                                    if(_formKey.currentState!.validate()){
                                    onTapVerify();}
                                  })
                            ]))
                  ]),
                ))));
  }

  onTapVerification() {
    Get.toNamed(
      AppRoutes.forgotPasswordScreen,
    );
  }

  onTapVerify() {
    Get.toNamed(
      AppRoutes.resetPasswordScreen,
    );
  }
}
