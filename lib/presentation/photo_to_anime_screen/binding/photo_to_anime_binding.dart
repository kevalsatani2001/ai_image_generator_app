import '../controller/photo_to_anime_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PhotoToAnimeScreen.
///
/// This class ensures that the PhotoToAnimeController is created when the
/// PhotoToAnimeScreen is first loaded.
class PhotoToAnimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoToAnimeController());
  }
}
