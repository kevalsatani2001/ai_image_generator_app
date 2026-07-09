import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_seven_screen/models/finalize_seven_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeSevenScreen.
///
/// This class manages the state of the FinalizeSevenScreen, including the
/// current finalizeSevenModelObj
class FinalizeSevenController extends GetxController {TextEditingController sunsetimageController = TextEditingController();

Rx<FinalizeSevenModel> finalizeSevenModelObj = FinalizeSevenModel().obs;

@override void onClose() { super.onClose(); sunsetimageController.dispose(); } 
 }
