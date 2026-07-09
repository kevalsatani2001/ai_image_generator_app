import '../controller/text_effects_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TextEffectsScreen.
///
/// This class ensures that the TextEffectsController is created when the
/// TextEffectsScreen is first loaded.
class TextEffectsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextEffectsController());
  }
}
