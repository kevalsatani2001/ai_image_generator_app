import '../controller/edit_artwork_two_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditArtworkTwoScreen.
///
/// This class ensures that the EditArtworkTwoController is created when the
/// EditArtworkTwoScreen is first loaded.
class EditArtworkTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditArtworkTwoController());
  }
}
