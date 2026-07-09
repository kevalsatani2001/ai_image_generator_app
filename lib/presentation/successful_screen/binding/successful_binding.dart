import '../controller/successful_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SuccessfulScreen.
///
/// This class ensures that the SuccessfulController is created when the
/// SuccessfulScreen is first loaded.
class SuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessfulController());
  }
}
