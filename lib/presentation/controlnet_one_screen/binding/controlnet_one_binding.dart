import '../controller/controlnet_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ControlnetOneScreen.
///
/// This class ensures that the ControlnetOneController is created when the
/// ControlnetOneScreen is first loaded.
class ControlnetOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlnetOneController());
  }
}
