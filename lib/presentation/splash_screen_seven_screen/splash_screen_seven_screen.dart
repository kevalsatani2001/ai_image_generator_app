import 'package:ai_image_generator/core/app_export.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import 'controller/splash_screen_seven_controller.dart';


class SplashScreenSevenScreen extends StatefulWidget {
  const SplashScreenSevenScreen({super.key});

  @override
  State<SplashScreenSevenScreen> createState() => _SplashScreenSevenScreenState();
}

class _SplashScreenSevenScreenState extends State<SplashScreenSevenScreen> {
  SplashScreenSevenController splashScreenSevenController = Get.put(SplashScreenSevenController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async{
        closeApp();
        return true;
      },
        child: Scaffold(
            body: ColorfulSafeArea(
              color: appTheme.white,
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                            svgPath: ImageConstant.imgFramePrimary59x101,
                            height: 59.v,
                            width: 101.h),
                        SizedBox(height: 21.v),
                        Text("lbl_artify".tr,
                            style: theme.textTheme.headlineMedium),
                        SizedBox(height: 5.v)
                      ])),
            )));
  }
}



