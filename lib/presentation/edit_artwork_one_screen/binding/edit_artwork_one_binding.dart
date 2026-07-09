import '../controller/edit_artwork_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the EditArtworkOneScreen.
///
/// This class ensures that the EditArtworkOneController is created when the
/// EditArtworkOneScreen is first loaded.
class EditArtworkOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditArtworkOneController());
  }
}
