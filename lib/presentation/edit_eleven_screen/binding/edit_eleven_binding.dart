import '../controller/edit_eleven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditElevenScreen.
///
/// This class ensures that the EditElevenController is created when the
/// EditElevenScreen is first loaded.
class EditElevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditElevenController());
  }
}
