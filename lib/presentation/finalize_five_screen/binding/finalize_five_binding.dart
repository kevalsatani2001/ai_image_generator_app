import '../controller/finalize_five_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeFiveScreen.
///
/// This class ensures that the FinalizeFiveController is created when the
/// FinalizeFiveScreen is first loaded.
class FinalizeFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeFiveController());
  }
}
