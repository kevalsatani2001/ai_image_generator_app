import '../controller/erase_object_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EraseObjectScreen.
///
/// This class ensures that the EraseObjectController is created when the
/// EraseObjectScreen is first loaded.
class EraseObjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EraseObjectController());
  }
}
