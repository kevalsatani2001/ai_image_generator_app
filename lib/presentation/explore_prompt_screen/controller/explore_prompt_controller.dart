import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/explore_prompt_screen/models/explore_prompt_model.dart';
import 'package:flutter/material.dart';

import '../../art_styles_screen/models/artstyle_item_model.dart';

/// A controller class for the ExplorePromptScreen.
///
/// This class manages the state of the ExplorePromptScreen, including the
/// current explorePromptModelObj
class ExplorePromptController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ArtstyleItemModel> explorePromptList =  ExplorePromptModel.getExplorePromptData();



}
