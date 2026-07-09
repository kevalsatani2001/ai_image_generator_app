import '../controller/finalize_eight_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeEightScreen.
///
/// This class ensures that the FinalizeEightController is created when the
/// FinalizeEightScreen is first loaded.
class FinalizeEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeEightController());
  }
}
