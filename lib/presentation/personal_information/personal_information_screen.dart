import 'package:ai_image_generator/core/app_export.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'controller/personal_information_controller.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  PerSonalInformationScreenController perSonalInformationScreenController = Get.put(PerSonalInformationScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: ColorfulSafeArea(
          color: appTheme.whiteA700,
          child: GetBuilder<PerSonalInformationScreenController>(
            init: PerSonalInformationScreenController(),
            builder: (controller) {
              if (controller.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: theme.colorScheme.primary),
                );
              }

              String displayName = "${controller.firstName} ${controller.lastName}".trim();
              if (displayName.isEmpty) displayName = "User Profile";
              String username = controller.firstName.isNotEmpty 
                  ? "@${controller.firstName.toLowerCase()}" 
                  : "@username";

              return Column(
                children: [
                  getCommonAppBar("lbl_personal_info".tr),
                  SizedBox(height: 16.v),
                  CustomImageView(
                    imagePath: controller.profileImage.isEmpty || controller.profileImage.startsWith('assets/')
                        ? ImageConstant.imgEllipse237104x104
                        : null,
                    url: controller.profileImage.isNotEmpty && !controller.profileImage.startsWith('assets/')
                        ? controller.profileImage
                        : null,
                    height: 104.adaptSize,
                    width: 104.adaptSize,
                    radius: BorderRadius.circular(52.h),
                    alignment: Alignment.center,
                  ),
                  SizedBox(height: 20.v),
                  Center(
                    child: Text(
                      displayName,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(height: 3.v),
                  Center(
                    child: Text(
                      username,
                      style: CustomTextStyles.bodyLargeGray700,
                    ),
                  ),
                  SizedBox(height: 32.v),
                  personalInformationOption("First Name", controller.firstName.isNotEmpty ? controller.firstName : "N/A"),
                  SizedBox(height: 16.v),
                  personalInformationOption("Last Name", controller.lastName.isNotEmpty ? controller.lastName : "N/A"),
                  SizedBox(height: 16.v),
                  personalInformationOption("Email Address", controller.email.isNotEmpty ? controller.email : "N/A"),
                ],
              );
            },
          ),
        ),
      ),
      onWillPop: () async {
        Get.back();
        return true;
      },
    );
  }

  personalInformationOption(title,subtitle){
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.h),
      child: Container(
        width: double.infinity,
        decoration: AppDecoration.fillGray10002
            .copyWith(
            borderRadius: BorderRadiusStyle
                .roundedBorder8),
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.v,horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: CustomTextStyles.bodyLargeGray700,),
              SizedBox(height: 8,),
              Text(subtitle,style: theme.textTheme.bodyLarge,),
            ],
          ),
        ),
      ),
    );
  }
}
