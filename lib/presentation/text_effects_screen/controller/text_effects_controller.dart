import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/text_effects_screen/models/text_effects_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the TextEffectsScreen.
///
/// This class manages the state of the TextEffectsScreen, including the
/// current textEffectsModelObj
class TextEffectsController extends GetxController {
  TextEditingController freeupspaceoneController = TextEditingController();

  Rx<TextEffectsModel> textEffectsModelObj = TextEffectsModel().obs;

  @override
  void onClose() {
    super.onClose();
    freeupspaceoneController.dispose();
  }
}
