import '../controller/images_to_painting_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ImagesToPaintingOneScreen.
///
/// This class ensures that the ImagesToPaintingOneController is created when the
/// ImagesToPaintingOneScreen is first loaded.
class ImagesToPaintingOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ImagesToPaintingOneController());
  }
}
