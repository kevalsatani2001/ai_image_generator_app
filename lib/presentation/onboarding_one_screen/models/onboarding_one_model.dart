import '../../../core/app_export.dart';
import 'sliderturnyourw_item_model.dart';

/// This class defines the variables used in the [onboarding_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  static List<SliderturnyourwItemModel> getOnboardingData() {
    return [
      SliderturnyourwItemModel(
          ImageConstant.onboarding1,
          "Turn your words artwork instantly",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
      SliderturnyourwItemModel(
          ImageConstant.onboarding2,
          "Create and share artwork with ease",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
      SliderturnyourwItemModel(
          ImageConstant.onboarding3,
          "Unleash your creativity Al toolbox",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor..."),
    ];
  }
}
