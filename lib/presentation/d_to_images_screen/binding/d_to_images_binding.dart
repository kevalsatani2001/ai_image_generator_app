import '../controller/d_to_images_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DToImagesScreen.
///
/// This class ensures that the DToImagesController is created when the
/// DToImagesScreen is first loaded.
class DToImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DToImagesController());
  }
}
