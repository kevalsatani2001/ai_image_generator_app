import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_screen/models/finalize_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeScreen.
///
/// This class manages the state of the FinalizeScreen, including the
/// current finalizeModelObj
class FinalizeController extends GetxController {TextEditingController seedvalueoneController = TextEditingController();

Rx<FinalizeModel> finalizeModelObj = FinalizeModel().obs;

Rx<bool> isSelectedSwitch = false.obs;

Rx<bool> isSelectedSwitch1 = false.obs;

Rx<bool> isSelectedSwitch2 = false.obs;

Rx<bool> isSelectedSwitch3 = false.obs;

@override void onClose() { super.onClose(); seedvalueoneController.dispose(); } 
 }
