import '../controller/realistic_generetor_fill_controller.dart';
import 'package:get/get.dart';

/// A binding class for the RealisticGeneretorFillScreen.
///
/// This class ensures that the RealisticGeneretorFillController is created when the
/// RealisticGeneretorFillScreen is first loaded.
class RealisticGeneretorFillBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RealisticGeneretorFillController());
  }
}
