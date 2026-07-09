import '../controller/upgrade_controller.dart';
import 'package:get/get.dart';

/// A binding class for the UpgradeScreen.
///
/// This class ensures that the UpgradeController is created when the
/// UpgradeScreen is first loaded.
class UpgradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpgradeController());
  }
}
