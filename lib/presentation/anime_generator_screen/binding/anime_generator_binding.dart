import '../controller/anime_generator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AnimeGeneratorScreen.
///
/// This class ensures that the AnimeGeneratorController is created when the
/// AnimeGeneratorScreen is first loaded.
class AnimeGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimeGeneratorController());
  }
}
