import '../controller/finalize_ten_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeTenScreen.
///
/// This class ensures that the FinalizeTenController is created when the
/// FinalizeTenScreen is first loaded.
class FinalizeTenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeTenController());
  }
}
