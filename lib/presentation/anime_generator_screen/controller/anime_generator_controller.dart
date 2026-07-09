import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/anime_generator_screen/models/anime_generator_model.dart';import 'package:flutter/material.dart';/// A controller class for the AnimeGeneratorScreen.
///
/// This class manages the state of the AnimeGeneratorScreen, including the
/// current animeGeneratorModelObj
class AnimeGeneratorController extends GetxController {TextEditingController typeanythingController = TextEditingController();

Rx<AnimeGeneratorModel> animeGeneratorModelObj = AnimeGeneratorModel().obs;

@override void onClose() { super.onClose(); typeanythingController.dispose(); } 
 }
