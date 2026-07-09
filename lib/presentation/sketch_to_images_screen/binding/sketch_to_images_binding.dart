import '../controller/sketch_to_images_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SketchToImagesScreen.
///
/// This class ensures that the SketchToImagesController is created when the
/// SketchToImagesScreen is first loaded.
class SketchToImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SketchToImagesController());
  }
}
