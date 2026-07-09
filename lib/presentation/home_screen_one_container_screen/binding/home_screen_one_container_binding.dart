import '../controller/home_screen_one_container_controller.dart';
import 'package:get/get.dart';

/// A binding class for the HomeScreenOneContainerScreen.
///
/// This class ensures that the HomeScreenOneContainerController is created when the
/// HomeScreenOneContainerScreen is first loaded.
class HomeScreenOneContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenOneContainerController());
  }
}
