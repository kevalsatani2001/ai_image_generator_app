import '../controller/finalize_six_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeSixScreen.
///
/// This class ensures that the FinalizeSixController is created when the
/// FinalizeSixScreen is first loaded.
class FinalizeSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeSixController());
  }
}
