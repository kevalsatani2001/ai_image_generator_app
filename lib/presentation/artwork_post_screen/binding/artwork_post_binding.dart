import '../controller/artwork_post_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtworkPostScreen.
///
/// This class ensures that the ArtworkPostController is created when the
/// ArtworkPostScreen is first loaded.
class ArtworkPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtworkPostController());
  }
}
