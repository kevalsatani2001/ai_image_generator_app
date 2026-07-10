import 'package:ai_image_generator/core/app_export.dart';

import '../../art_styles_screen/models/artstyle_item_model.dart';

/// A controller class for the ExplorePromptPhotoDetailPopupScreen.
///
/// This class manages the state of the ExplorePromptPhotoDetailPopupScreen, including the
/// current explorePromptPhotoDetailPopupModelObj
class ExplorePromptPhotoDetailPopupController extends GetxController {
 ArtstyleItemModel? currentImageData;

 void setCurrentImageData(ArtstyleItemModel explorePromptItemModelObj) {
  currentImageData = explorePromptItemModelObj;
  update();

 }
}
