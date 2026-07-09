import '../controller/finalize_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeThreeScreen.
///
/// This class ensures that the FinalizeThreeController is created when the
/// FinalizeThreeScreen is first loaded.
class FinalizeThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeThreeController());
  }
}
