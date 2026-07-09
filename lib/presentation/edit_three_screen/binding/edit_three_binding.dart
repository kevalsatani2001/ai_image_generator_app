import '../controller/edit_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditThreeScreen.
///
/// This class ensures that the EditThreeController is created when the
/// EditThreeScreen is first loaded.
class EditThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditThreeController());
  }
}
