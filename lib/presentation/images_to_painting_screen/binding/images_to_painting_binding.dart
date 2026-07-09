import '../controller/images_to_painting_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ImagesToPaintingScreen.
///
/// This class ensures that the ImagesToPaintingController is created when the
/// ImagesToPaintingScreen is first loaded.
class ImagesToPaintingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagesToPaintingController());
  }
}
