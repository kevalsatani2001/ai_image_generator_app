import '../controller/controlnet_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ControlnetScreen.
///
/// This class ensures that the ControlnetController is created when the
/// ControlnetScreen is first loaded.
class ControlnetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlnetController());
  }
}
