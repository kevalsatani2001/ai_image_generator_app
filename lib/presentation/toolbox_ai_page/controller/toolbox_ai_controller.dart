import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/toolbox_ai_page/models/toolbox_ai_model.dart';

import '../../art_styles_screen/models/artstyle_item_model.dart';

/// A controller class for the ToolboxAiPage.
///
/// This class manages the state of the ToolboxAiPage, including the
/// current toolboxAiModelObj
class ToolboxAiController extends GetxController {
 List<ArtstyleItemModel> toolboxai = ToolboxAiModel.gettoolboxaiData();
}
