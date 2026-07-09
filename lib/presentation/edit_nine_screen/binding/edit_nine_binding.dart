import '../controller/edit_nine_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditNineScreen.
///
/// This class ensures that the EditNineController is created when the
/// EditNineScreen is first loaded.
class EditNineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditNineController());
  }
}
