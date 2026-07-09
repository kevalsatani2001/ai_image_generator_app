import '../controller/download_artwork_controller.dart';
import 'package:get/get.dart';

/// A binding class for the DownloadArtworkScreen.
///
/// This class ensures that the DownloadArtworkController is created when the
/// DownloadArtworkScreen is first loaded.
class DownloadArtworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DownloadArtworkController());
  }
}
