import '../controller/ai_avtar_generator_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AiAvtarGeneratorTwoScreen.
///
/// This class ensures that the AiAvtarGeneratorTwoController is created when the
/// AiAvtarGeneratorTwoScreen is first loaded.
class AiAvtarGeneratorTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiAvtarGeneratorTwoController());
  }
}
