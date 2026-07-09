import '../controller/sketch_to_images_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SketchToImagesTwoScreen.
///
/// This class ensures that the SketchToImagesTwoController is created when the
/// SketchToImagesTwoScreen is first loaded.
class SketchToImagesTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SketchToImagesTwoController());
  }
}
