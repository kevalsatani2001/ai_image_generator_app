import '../controller/edit_ten_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditTenScreen.
///
/// This class ensures that the EditTenController is created when the
/// EditTenScreen is first loaded.
class EditTenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTenController());
  }
}
