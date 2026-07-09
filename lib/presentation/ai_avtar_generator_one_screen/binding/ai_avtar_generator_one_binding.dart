import '../controller/ai_avtar_generator_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AiAvtarGeneratorOneScreen.
///
/// This class ensures that the AiAvtarGeneratorOneController is created when the
/// AiAvtarGeneratorOneScreen is first loaded.
class AiAvtarGeneratorOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiAvtarGeneratorOneController());
  }
}
