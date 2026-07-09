import '../controller/realistic_generetor_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RealisticGeneretorScreen.
///
/// This class ensures that the RealisticGeneretorController is created when the
/// RealisticGeneretorScreen is first loaded.
class RealisticGeneretorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealisticGeneretorController());
  }
}
