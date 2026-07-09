import '../controller/finalize_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeScreen.
///
/// This class ensures that the FinalizeController is created when the
/// FinalizeScreen is first loaded.
class FinalizeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeController());
  }
}
