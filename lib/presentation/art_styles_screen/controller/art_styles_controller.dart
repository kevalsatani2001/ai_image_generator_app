import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/art_styles_screen/models/art_styles_model.dart';
import 'package:flutter/material.dart';

import '../models/artstyle_item_model.dart';

/// A controller class for the ArtStylesScreen.
///
/// This class manages the state of the ArtStylesScreen, including the
/// current artStylesModelObj
class ArtStylesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  List<ArtstyleItemModel> artStyleData =  ArtStylesModel.getArtStyleData();
  ArtstyleItemModel? currentArt;
  int? currentArtId;
  void setCurrentArt(ArtstyleItemModel artstyleItemModelObj) {
    currentArt = artstyleItemModelObj;
    currentArtId = currentArt!.id!;
    update();
  }
}
