import '../controller/sketch_to_images_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SketchToImagesThreeScreen.
///
/// This class ensures that the SketchToImagesThreeController is created when the
/// SketchToImagesThreeScreen is first loaded.
class SketchToImagesThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SketchToImagesThreeController());
  }
}
