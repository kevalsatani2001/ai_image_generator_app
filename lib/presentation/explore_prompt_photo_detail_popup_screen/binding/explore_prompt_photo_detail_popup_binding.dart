import '../controller/explore_prompt_photo_detail_popup_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExplorePromptPhotoDetailPopupScreen.
///
/// This class ensures that the ExplorePromptPhotoDetailPopupController is created when the
/// ExplorePromptPhotoDetailPopupScreen is first loaded.
class ExplorePromptPhotoDetailPopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExplorePromptPhotoDetailPopupController());
  }
}
