import '../controller/edit_seven_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditSevenScreen.
///
/// This class ensures that the EditSevenController is created when the
/// EditSevenScreen is first loaded.
class EditSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditSevenController());
  }
}
