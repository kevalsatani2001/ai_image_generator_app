import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_three_screen/models/finalize_three_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeThreeScreen.
///
/// This class manages the state of the FinalizeThreeScreen, including the
/// current finalizeThreeModelObj
class FinalizeThreeController extends GetxController {TextEditingController actionname3enusController = TextEditingController();

Rx<FinalizeThreeModel> finalizeThreeModelObj = FinalizeThreeModel().obs;

@override void onClose() { super.onClose(); actionname3enusController.dispose(); } 
 }
