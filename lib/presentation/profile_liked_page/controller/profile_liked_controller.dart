import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_liked_page/models/profile_liked_model.dart';

import '../../discover_artwork_page/models/discover1_item_model.dart';
import '../../discover_artwork_page/models/discover_artwork_model.dart';

/// A controller class for the ProfileLikedPage.
///
/// This class manages the state of the ProfileLikedPage, including the
/// current profileLikedModelObj
class ProfileLikedController extends GetxController {
 List<Discover1ItemModel> discoverArtworkData =
 DiscoverArtworkModel.getDiscoverArtworkData();
}
