import '../controller/edit_eight_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditEightScreen.
///
/// This class ensures that the EditEightController is created when the
/// EditEightScreen is first loaded.
class EditEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditEightController());
  }
}
