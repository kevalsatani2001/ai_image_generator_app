import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/text_effects_one_screen/models/text_effects_one_model.dart';
import 'package:flutter/material.dart';

import '../models/grida_one_item_model.dart';

/// A controller class for the TextEffectsOneScreen.
///
/// This class manages the state of the TextEffectsOneScreen, including the
/// current textEffectsOneModelObj
class TextEffectsOneController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<GridaOneItemModel> textEffectList =  TextEffectsOneModel.getTextEffectData();
  TextEditingController textEffectController = TextEditingController();
  TextEditingController freeupspaceoneController = TextEditingController();
  GridaOneItemModel? currentTextEffect;
  String currentText = "";
  int curretTextEffextID = 0;
  void setCurrentTextEffect(GridaOneItemModel gridaOneItemModelObj) {
    currentTextEffect = gridaOneItemModelObj;
    curretTextEffextID = currentTextEffect!.id!;
    update();

  }
}
