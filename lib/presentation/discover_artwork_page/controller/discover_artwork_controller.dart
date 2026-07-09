import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/discover_artwork_page/models/discover_artwork_model.dart';

import '../models/discover1_item_model.dart';

class DiscoverArtworkController extends GetxController {
  List<Discover1ItemModel> discoverArtworkData = DiscoverArtworkModel.getDiscoverArtworkData();
}
