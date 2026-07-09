import '../controller/recolour_image_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RecolourImageOneScreen.
///
/// This class ensures that the RecolourImageOneController is created when the
/// RecolourImageOneScreen is first loaded.
class RecolourImageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecolourImageOneController());
  }
}
