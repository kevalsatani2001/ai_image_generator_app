import '../controller/extend_images_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExtendImagesScreen.
///
/// This class ensures that the ExtendImagesController is created when the
/// ExtendImagesScreen is first loaded.
class ExtendImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExtendImagesController());
  }
}
