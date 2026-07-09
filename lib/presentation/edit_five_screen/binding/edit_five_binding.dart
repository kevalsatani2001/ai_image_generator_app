import '../controller/edit_five_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditFiveScreen.
///
/// This class ensures that the EditFiveController is created when the
/// EditFiveScreen is first loaded.
class EditFiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditFiveController());
  }
}
