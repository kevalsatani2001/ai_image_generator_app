import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/onboarding_one_screen/models/onboarding_one_model.dart';
import 'package:flutter/material.dart';

import '../models/sliderturnyourw_item_model.dart';

/// A controller class for the OnboardingOneScreen.
///
/// This class manages the state of the OnboardingOneScreen, including the
/// current onboardingOneModelObj
class OnboardingOneController extends GetxController {
  List<SliderturnyourwItemModel> onbordingData =OnboardingOneModel.getOnboardingData();
PageController pageController = PageController();
  Rx<int> sliderIndex = 0.obs;
  int currentPage = 0;

  void setCurrentPage(int value) {
   currentPage = value;
   update();
  }
}
