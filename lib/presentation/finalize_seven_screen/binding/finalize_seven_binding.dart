import '../controller/finalize_seven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the FinalizeSevenScreen.
///
/// This class ensures that the FinalizeSevenController is created when the
/// FinalizeSevenScreen is first loaded.
class FinalizeSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FinalizeSevenController());
  }
}
