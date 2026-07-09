import '../controller/explore_prompt_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExplorePromptScreen.
///
/// This class ensures that the ExplorePromptController is created when the
/// ExplorePromptScreen is first loaded.
class ExplorePromptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorePromptController());
  }
}
