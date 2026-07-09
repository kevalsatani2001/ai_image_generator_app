import '../controller/batch_art_generator_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the BatchArtGeneratorOneScreen.
///
/// This class ensures that the BatchArtGeneratorOneController is created when the
/// BatchArtGeneratorOneScreen is first loaded.
class BatchArtGeneratorOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BatchArtGeneratorOneController());
  }
}
