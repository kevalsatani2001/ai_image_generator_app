import '../controller/ai_avtar_generator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AiAvtarGeneratorScreen.
///
/// This class ensures that the AiAvtarGeneratorController is created when the
/// AiAvtarGeneratorScreen is first loaded.
class AiAvtarGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiAvtarGeneratorController());
  }
}
