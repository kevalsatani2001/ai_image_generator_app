import '../controller/extend_images_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ExtendImagesOneScreen.
///
/// This class ensures that the ExtendImagesOneController is created when the
/// ExtendImagesOneScreen is first loaded.
class ExtendImagesOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExtendImagesOneController());
  }
}
