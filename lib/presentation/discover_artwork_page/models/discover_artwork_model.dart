import '../../../core/app_export.dart';
import 'discover1_item_model.dart';

/// This class defines the variables used in the [discover_artwork_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverArtworkModel {
  static List<Discover1ItemModel> getDiscoverArtworkData(){
   return [
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork1,1),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork2,2),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork3,3),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork4,4),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork5,5),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork6,6),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork7,7),
    Discover1ItemModel(ImageConstant.imgDiscoverArtwork8,8),
   ];
  }
}
