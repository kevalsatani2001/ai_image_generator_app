import '../controller/discover_creator_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DiscoverCreatorScreen.
///
/// This class ensures that the DiscoverCreatorController is created when the
/// DiscoverCreatorScreen is first loaded.
class DiscoverCreatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverCreatorController());
  }
}
