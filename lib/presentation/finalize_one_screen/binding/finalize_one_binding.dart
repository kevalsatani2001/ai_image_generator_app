import '../controller/finalize_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeOneScreen.
///
/// This class ensures that the FinalizeOneController is created when the
/// FinalizeOneScreen is first loaded.
class FinalizeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeOneController());
  }
}
