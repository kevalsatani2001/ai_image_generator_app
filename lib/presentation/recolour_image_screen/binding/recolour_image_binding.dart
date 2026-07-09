import '../controller/recolour_image_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecolourImageScreen.
///
/// This class ensures that the RecolourImageController is created when the
/// RecolourImageScreen is first loaded.
class RecolourImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecolourImageController());
  }
}
