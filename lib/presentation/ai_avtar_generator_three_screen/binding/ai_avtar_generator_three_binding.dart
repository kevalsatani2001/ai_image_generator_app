import '../controller/ai_avtar_generator_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AiAvtarGeneratorThreeScreen.
///
/// This class ensures that the AiAvtarGeneratorThreeController is created when the
/// AiAvtarGeneratorThreeScreen is first loaded.
class AiAvtarGeneratorThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiAvtarGeneratorThreeController());
  }
}
