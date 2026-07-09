import '../controller/edit_four_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditFourScreen.
///
/// This class ensures that the EditFourController is created when the
/// EditFourScreen is first loaded.
class EditFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditFourController());
  }
}
