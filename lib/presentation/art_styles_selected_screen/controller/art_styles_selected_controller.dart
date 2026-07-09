import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/art_styles_selected_screen/models/art_styles_selected_model.dart';import 'package:flutter/material.dart';/// A controller class for the ArtStylesSelectedScreen.
///
/// This class manages the state of the ArtStylesSelectedScreen, including the
/// current artStylesSelectedModelObj
class ArtStylesSelectedController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<ArtStylesSelectedModel> artStylesSelectedModelObj = ArtStylesSelectedModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
