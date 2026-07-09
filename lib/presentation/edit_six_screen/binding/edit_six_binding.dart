import '../controller/edit_six_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditSixScreen.
///
/// This class ensures that the EditSixController is created when the
/// EditSixScreen is first loaded.
class EditSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditSixController());
  }
}
