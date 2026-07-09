import '../controller/edit_artwork_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditArtworkScreen.
///
/// This class ensures that the EditArtworkController is created when the
/// EditArtworkScreen is first loaded.
class EditArtworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditArtworkController());
  }
}
