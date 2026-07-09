import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/social_media_screen/models/social_media_model.dart';

import '../models/header_item_model.dart';

/// A controller class for the SocialMediaScreen.
///
/// This class manages the state of the SocialMediaScreen, including the
/// current socialMediaModelObj
class SocialMediaController extends GetxController {
 List<HeaderItemModel> socialMediaList = SocialMediaModel.getSocialMediaList();
}
