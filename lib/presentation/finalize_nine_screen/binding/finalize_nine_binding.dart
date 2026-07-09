import '../controller/finalize_nine_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeNineScreen.
///
/// This class ensures that the FinalizeNineController is created when the
/// FinalizeNineScreen is first loaded.
class FinalizeNineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeNineController());
  }
}
