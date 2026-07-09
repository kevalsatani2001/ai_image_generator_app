import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/language_screen/models/language_model.dart';
import 'package:flutter/material.dart';

import '../models/language_data.dart';

/// A controller class for the LanguageScreen.
///
/// This class manages the state of the LanguageScreen, including the
/// current languageModelObj
class LanguageController extends GetxController {
 List<LanguageModel> generelLanguageList = LanguageData.getGenerelLanguage();
 List<LanguageModel> languageList = LanguageData.getlLanguage();
 int currentLangugeId= 1;
}
