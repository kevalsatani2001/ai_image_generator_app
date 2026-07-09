import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/photo_to_anime_one_screen/models/photo_to_anime_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the PhotoToAnimeOneScreen.
///
/// This class manages the state of the PhotoToAnimeOneScreen, including the
/// current photoToAnimeOneModelObj
class PhotoToAnimeOneController extends GetxController {TextEditingController editartworkoneController = TextEditingController();

Rx<PhotoToAnimeOneModel> photoToAnimeOneModelObj = PhotoToAnimeOneModel().obs;

@override void onClose() { super.onClose(); editartworkoneController.dispose(); } 
 }
