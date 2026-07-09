import '../controller/edit_input_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditInputScreen.
///
/// This class ensures that the EditInputController is created when the
/// EditInputScreen is first loaded.
class EditInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditInputController());
  }
}
