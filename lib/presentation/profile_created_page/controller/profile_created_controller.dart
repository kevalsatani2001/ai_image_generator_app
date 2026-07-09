import 'package:ai_image_generator/core/app_export.dart';
import '../../discover_artwork_page/models/discover1_item_model.dart';
import '../../discover_artwork_page/models/discover_artwork_model.dart';

/// A controller class for the ProfileCreatedPage.
///
/// This class manages the state of the ProfileCreatedPage, including the
/// current profileCreatedModelObj
class ProfileCreatedController extends GetxController {


  List<Discover1ItemModel> discoverArtworkData =
      DiscoverArtworkModel.getDiscoverArtworkData();
}
