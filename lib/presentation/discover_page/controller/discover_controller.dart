import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/discover_page/models/discover_model.dart';

import '../models/discover_item_model.dart';


class DiscoverController extends GetxController {
 List<DiscoverItemModel> createdData = DiscoverModel.getCreaterData();
}
