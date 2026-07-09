import '../controller/text_effects_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the TextEffectsOneScreen.
///
/// This class ensures that the TextEffectsOneController is created when the
/// TextEffectsOneScreen is first loaded.
class TextEffectsOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TextEffectsOneController());
  }
}
