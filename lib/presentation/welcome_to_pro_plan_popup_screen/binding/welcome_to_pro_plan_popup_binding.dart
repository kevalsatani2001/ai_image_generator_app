import '../controller/welcome_to_pro_plan_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the WelcomeToProPlanPopupScreen.
///
/// This class ensures that the WelcomeToProPlanPopupController is created when the
/// WelcomeToProPlanPopupScreen is first loaded.
class WelcomeToProPlanPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeToProPlanPopupController());
  }
}
