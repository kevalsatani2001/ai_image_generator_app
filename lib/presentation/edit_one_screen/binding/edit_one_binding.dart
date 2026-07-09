import '../controller/edit_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditOneScreen.
///
/// This class ensures that the EditOneController is created when the
/// EditOneScreen is first loaded.
class EditOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditOneController());
  }
}
