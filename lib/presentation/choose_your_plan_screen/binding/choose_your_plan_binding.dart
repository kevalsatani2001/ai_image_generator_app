import '../controller/choose_your_plan_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ChooseYourPlanScreen.
///
/// This class ensures that the ChooseYourPlanController is created when the
/// ChooseYourPlanScreen is first loaded.
class ChooseYourPlanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseYourPlanController());
  }
}
