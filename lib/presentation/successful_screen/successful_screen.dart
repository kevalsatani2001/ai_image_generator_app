import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';






class SuccessfulScreen extends StatefulWidget {
   SuccessfulScreen({super.key,required this.function});
   Function function;

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 16.h, vertical: 24.v),
            decoration: AppDecoration.white.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16),
            child:
            Column(mainAxisSize: MainAxisSize.min, children: [
              CustomImageView(
                  svgPath: ImageConstant.imgCheckmark,
                  height: 98.adaptSize,
                  width: 98.adaptSize),
              SizedBox(height: 26.v),
              Text("lbl_successful".tr,
                  style: theme.textTheme.headlineSmall),
              SizedBox(height: 18.v),
              SizedBox(
                  width: 338.h,
                  child: Text("msg_your_artwork_has".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!
                          .copyWith(height: 1.50))),
              SizedBox(height: 37.v),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: CustomOutlinedButton(
                            text: "lbl_back".tr,
                            margin: EdgeInsets.only(right: 10.h),
                            onTap: () {
                              Get.back();
                            })),
                    Expanded(
                        child: CustomElevatedButton(
                            onTap: (){},
                            text: "lbl_view_art".tr,
                            margin: EdgeInsets.only(left: 10.h)))
                  ])
            ])));
  }

  onTapBack() {
    Get.toNamed(
      AppRoutes.finalizeScreen,
    );
  }
}






