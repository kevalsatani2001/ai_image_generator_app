import 'package:ai_image_generator/core/app_export.dart';

import '../../art_styles_screen/models/artstyle_item_model.dart';
import '../models/created_data.dart';

/// A controller class for the ProfilePage.
///
/// This class manages the state of the ProfilePage, including the
/// current profileModelObj
class ProfileController extends GetxController {
  List<ArtstyleItemModel> createdDataList = CreatedTabData.getCreatedData();
}
