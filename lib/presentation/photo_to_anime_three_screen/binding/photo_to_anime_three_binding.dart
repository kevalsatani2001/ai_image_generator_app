import '../controller/photo_to_anime_three_controller.dart';
import 'package:get/get.dart';

/// A binding class for the PhotoToAnimeThreeScreen.
///
/// This class ensures that the PhotoToAnimeThreeController is created when the
/// PhotoToAnimeThreeScreen is first loaded.
class PhotoToAnimeThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoToAnimeThreeController());
  }
}
