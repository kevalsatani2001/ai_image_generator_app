import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/download_artwork_screen/models/download_artwork_model.dart';
import '../models/art_size_data.dart';

class DownloadArtworkController extends GetxController {
 List<DownloadArtworkModel> artSizeData =  ArtSizeData.getArtSizeData();
  Rx<bool> checkmark = false.obs;
 int cutrrentSizeId = 1;
  void setCurrentSize(DownloadArtworkModel data) {
   cutrrentSizeId  = data.id!;
   update();
  }
}
