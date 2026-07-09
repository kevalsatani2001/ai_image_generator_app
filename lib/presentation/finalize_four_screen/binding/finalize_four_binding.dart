import '../controller/finalize_four_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeFourScreen.
///
/// This class ensures that the FinalizeFourController is created when the
/// FinalizeFourScreen is first loaded.
class FinalizeFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeFourController());
  }
}
