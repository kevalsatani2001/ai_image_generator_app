import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'controller/edit_profile_controller.dart';
import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/core/utils/validation_functions.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';




class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  EditProfileController controller = Get.put(EditProfileController());

  @override
  void initState() {
    // TODO: implement initState
    controller.emailController.text = "msg_johnabram_gmail_com".tr;
    controller.nameController.text = "lbl_john".tr;
    controller.lastNameController.text = "lbl_abram".tr;
    super.initState();
  }

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
          color: appTheme.whiteA700,
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  getCommonAppBar("Edit profile"),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 16.v,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 104.adaptSize,
                          width: 104.adaptSize,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgEllipse237104x104,
                                height: 104.adaptSize,
                                width: 104.adaptSize,
                                radius: BorderRadius.circular(
                                  52.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              Container(
                                height: 40.v,
                                width: 40.v,
                                decoration: BoxDecoration(
                                    color: appTheme.whiteA700,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: appTheme.black900.withOpacity(0.08),
                                          offset: Offset(0, 8),
                                          blurRadius: 11
                                      )
                                    ]),
                                child: Padding(
                                  padding:  EdgeInsets.all(8.h),
                                  child: CustomImageView(
                                    svgPath: ImageConstant.imgEdit,
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                        SizedBox(height: 40.v),
                        CustomTextFormField(
                          controller: controller.nameController,
                          hintText: "First name",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.h,
                            vertical: 17.v,
                          ),
                        ),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                          controller: controller.lastNameController,
                          hintText: "Last Name",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.h,
                            vertical: 17.v,
                          ),
                        ),
                        SizedBox(height: 24.v),
                        CustomTextFormField(
                          controller: controller.emailController,
                          hintText: "Email address",
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null ||
                                (!isValidEmail(value, isRequired: true))) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.h,
                            vertical: 17.v,
                          ),
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            left: 20.h,
            right: 20.h,
            bottom: 24.v,
          ),
          decoration: AppDecoration.white,
          child: CustomElevatedButton(
            onTap: (){
              Get.back();
            },
            text: "lbl_save".tr,
          ),
        ),
      ),
    );
  }
}





