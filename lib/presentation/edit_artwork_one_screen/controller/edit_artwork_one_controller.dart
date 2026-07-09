import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/edit_artwork_one_screen/models/edit_artwork_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditArtworkOneScreen.
///
/// This class manages the state of the EditArtworkOneScreen, including the
/// current editArtworkOneModelObj
class EditArtworkOneController extends GetxController {TextEditingController actionbeautyfulController = TextEditingController();

Rx<EditArtworkOneModel> editArtworkOneModelObj = EditArtworkOneModel().obs;

@override void onClose() { super.onClose(); actionbeautyfulController.dispose(); } 
 }
