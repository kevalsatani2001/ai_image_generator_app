import '../controller/photo_to_anime_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PhotoToAnimeTwoScreen.
///
/// This class ensures that the PhotoToAnimeTwoController is created when the
/// PhotoToAnimeTwoScreen is first loaded.
class PhotoToAnimeTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoToAnimeTwoController());
  }
}
