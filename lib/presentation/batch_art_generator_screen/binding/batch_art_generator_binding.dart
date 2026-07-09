import '../controller/batch_art_generator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BatchArtGeneratorScreen.
///
/// This class ensures that the BatchArtGeneratorController is created when the
/// BatchArtGeneratorScreen is first loaded.
class BatchArtGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BatchArtGeneratorController());
  }
}
