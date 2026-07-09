import '../controller/art_styles_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtStylesScreen.
///
/// This class ensures that the ArtStylesController is created when the
/// ArtStylesScreen is first loaded.
class ArtStylesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtStylesController());
  }
}
