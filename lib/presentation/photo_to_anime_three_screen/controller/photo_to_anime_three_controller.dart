import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/photo_to_anime_three_screen/models/photo_to_anime_three_model.dart';

/// A controller class for the PhotoToAnimeThreeScreen.
///
/// This class manages the state of the PhotoToAnimeThreeScreen, including the
/// current photoToAnimeThreeModelObj
class PhotoToAnimeThreeController extends GetxController {
  Rx<PhotoToAnimeThreeModel> photoToAnimeThreeModelObj =
      PhotoToAnimeThreeModel().obs;
}
