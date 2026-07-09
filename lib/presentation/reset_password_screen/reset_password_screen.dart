import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/password_changed_popup_screen/password_changed_popup_screen.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'controller/reset_password_controller.dart';




class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
 ResetPasswordController controller = Get.put(ResetPasswordController());
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return ColorfulSafeArea(
      color: appTheme.white,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
              width: double.maxFinite,
              child: Form(
               key: _formKey,
                child: Column(children: [
                 getCommonAppBar("lbl_reset_password".tr),
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
                          Obx(() => CustomTextFormField(
                              hintText: "New password",
                              controller: controller.filledoneController,
                              suffix: InkWell(
                                  onTap: () {
                                   controller.isShowPassword.value =
                                   !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 16.v, 16.h, 16.v),
                                      child: CustomImageView(
                                          svgPath: controller
                                              .isShowPassword.value
                                              ? ImageConstant.imgEyeOff
                                              : ImageConstant.imgEye))),
                              validator: (value) {
                               if (value == null || value.isEmpty) {
                                return "Please enter valid password";
                               }
                               return null;
                              },
                              suffixConstraints:
                              BoxConstraints(maxHeight: 56.v),
                              obscureText: controller.isShowPassword.value)),
                          SizedBox(height: 24.v),
                          Obx(() => CustomTextFormField(
                              hintText: "Confirm password",
                              controller: controller.filledthreeController,
                              textInputAction: TextInputAction.done,
                              suffix: InkWell(
                                  onTap: () {
                                   controller.isShowPassword1.value =
                                   !controller.isShowPassword1.value;
                                  },
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          30.h, 16.v, 16.h, 16.v),
                                      child: CustomImageView(
                                          svgPath: controller
                                              .isShowPassword1.value
                                              ? ImageConstant.imgEyeOff
                                              : ImageConstant.imgEye))),
                              validator: (value) {
                               if (value == null || value.isEmpty) {
                                return "Please enter valid password";
                               }
                               return null;
                              },
                              suffixConstraints:
                              BoxConstraints(maxHeight: 56.v),
                              obscureText: controller.isShowPassword1.value)),
                          SizedBox(height: 40.v),
                          CustomElevatedButton(
                              text: "lbl_create".tr,
                              onTap: () {
                               if(_formKey.currentState!.validate()){
                               onTapCreate();}
                              }),
                          SizedBox(height: 5.v)
                         ]))
                ]),
              ))));
 }

 onTapResetpassword() {
  Get.toNamed(
   AppRoutes.verificationScreen,
  );
 }

 onTapCreate() {

  showDialog(
   barrierDismissible: false,
   context: context,
   builder: (context) {
    return AlertDialog(
        insetPadding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.zero,
        content: PasswordChangedPopupScreen());
   },
  );


 }
}


