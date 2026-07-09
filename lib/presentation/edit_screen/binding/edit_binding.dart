import '../controller/edit_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditScreen.
///
/// This class ensures that the EditController is created when the
/// EditScreen is first loaded.
class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditController());
  }
}
