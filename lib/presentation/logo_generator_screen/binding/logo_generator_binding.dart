import '../controller/logo_generator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LogoGeneratorScreen.
///
/// This class ensures that the LogoGeneratorController is created when the
/// LogoGeneratorScreen is first loaded.
class LogoGeneratorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LogoGeneratorController());
  }
}
