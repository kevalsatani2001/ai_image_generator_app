import '../controller/finalize_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeTwoScreen.
///
/// This class ensures that the FinalizeTwoController is created when the
/// FinalizeTwoScreen is first loaded.
class FinalizeTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeTwoController());
  }
}
