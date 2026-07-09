import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/photo_to_anime_screen/models/photo_to_anime_model.dart';import 'package:flutter/material.dart';/// A controller class for the PhotoToAnimeScreen.
///
/// This class manages the state of the PhotoToAnimeScreen, including the
/// current photoToAnimeModelObj
class PhotoToAnimeController extends GetxController {TextEditingController editartworkoneController = TextEditingController();

Rx<PhotoToAnimeModel> photoToAnimeModelObj = PhotoToAnimeModel().obs;

@override void onClose() { super.onClose(); editartworkoneController.dispose(); } 
 }
