import '../controller/social_media_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SocialMediaScreen.
///
/// This class ensures that the SocialMediaController is created when the
/// SocialMediaScreen is first loaded.
class SocialMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SocialMediaController());
  }
}
