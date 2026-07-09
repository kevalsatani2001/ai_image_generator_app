import '../controller/sketch_to_images_four_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SketchToImagesFourScreen.
///
/// This class ensures that the SketchToImagesFourController is created when the
/// SketchToImagesFourScreen is first loaded.
class SketchToImagesFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SketchToImagesFourController());
  }
}
