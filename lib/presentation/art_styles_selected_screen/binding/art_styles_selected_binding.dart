import '../controller/art_styles_selected_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ArtStylesSelectedScreen.
///
/// This class ensures that the ArtStylesSelectedController is created when the
/// ArtStylesSelectedScreen is first loaded.
class ArtStylesSelectedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArtStylesSelectedController());
  }
}
