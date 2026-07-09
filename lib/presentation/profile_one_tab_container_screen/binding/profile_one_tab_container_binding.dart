import '../controller/profile_one_tab_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ProfileOneTabContainerScreen.
///
/// This class ensures that the ProfileOneTabContainerController is created when the
/// ProfileOneTabContainerScreen is first loaded.
class ProfileOneTabContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileOneTabContainerController());
  }
}
