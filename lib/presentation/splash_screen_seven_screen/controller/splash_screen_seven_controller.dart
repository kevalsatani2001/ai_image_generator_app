import 'dart:async';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/splash_screen_seven_screen/models/splash_screen_seven_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A controller class for the SplashScreenSevenScreen.
///
/// This class manages the state of the SplashScreenSevenScreen, including the
/// current splashScreenSevenModelObj
class SplashScreenSevenController extends GetxController {
  Rx<SplashScreenSevenModel> splashScreenSevenModelObj =
      SplashScreenSevenModel().obs;

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      _getIsFirst();
    });
  }

  _getIsFirst() async {
    bool isIntro = await PrefUtils.getIsIntro();
    User? currentUser = FirebaseAuth.instance.currentUser;
    Timer(const Duration(seconds: 3), () {
      print("is intro ====== $isIntro");
      print("currentUser ====== ${currentUser?.uid}");
      if (isIntro) {
        Get.toNamed(AppRoutes.onboardingOneScreen);
      } else if (currentUser != null) {
        Get.toNamed(AppRoutes.homeScreenOneContainerScreen);
      } else {
        Get.toNamed(AppRoutes.loginScreen);
      }
    });
  }
}
