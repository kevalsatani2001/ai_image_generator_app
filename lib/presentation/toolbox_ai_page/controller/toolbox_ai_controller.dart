import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/toolbox_ai_page/models/toolbox_ai_model.dart';

import 'package:flutter/material.dart';

import '../../art_styles_screen/models/artstyle_item_model.dart';

/// A controller class for the ToolboxAiPage.
///
/// This class manages the state of the ToolboxAiPage, including the
/// current toolboxAiModelObj
class ToolboxAiController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ArtstyleItemModel> _toolboxai = ToolboxAiModel.gettoolboxaiData();

  RxString searchQuery = "".obs;

  final Map<int, String> toolRoutes = {
    1: AppRoutes.aiAvtarGeneratorScreen,       // AI avatar generator
    2: AppRoutes.animeGeneratorScreen,          // Anime generator
    3: AppRoutes.photoToAnimeThreeScreen,      // Photo to anime
    4: AppRoutes.artStylesScreen,               // The colourfull
    5: AppRoutes.realisticGeneretorScreen,      // Realistic generator
    6: AppRoutes.textEffectsOneScreen,          // Text effects
    7: AppRoutes.sketchToImagesThreeScreen,     // Sketch to images
    8: AppRoutes.imagesToPaintingOneScreen,     // Images to painting
    9: AppRoutes.recolourImageScreen,           // Recolor images
    10: AppRoutes.extendImagesScreen,           // Extend images
    11: AppRoutes.dToImagesScreen,              // 3D to images
    12: AppRoutes.sketchToImagesFourScreen,     // Text to pattern (text to pattern maps here)
    13: AppRoutes.logoGeneratorScreen,          // Logo generator
    14: AppRoutes.controlnetOneScreen,          // Controlnet
    15: AppRoutes.batchArtGeneratorOneScreen,   // Batch art generator
  };

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  List<ArtstyleItemModel> get toolboxai {
    if (searchQuery.value.trim().isEmpty) {
      return _toolboxai;
    }
    return _toolboxai
        .where((element) =>
            element.title!.toLowerCase().contains(searchQuery.value.trim().toLowerCase()))
        .toList();
  }
}
