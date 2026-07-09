import '../controller/edit_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditTwoScreen.
///
/// This class ensures that the EditTwoController is created when the
/// EditTwoScreen is first loaded.
class EditTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTwoController());
  }
}
