import '../controller/photo_to_anime_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PhotoToAnimeOneScreen.
///
/// This class ensures that the PhotoToAnimeOneController is created when the
/// PhotoToAnimeOneScreen is first loaded.
class PhotoToAnimeOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoToAnimeOneController());
  }
}
