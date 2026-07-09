import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_five_screen/models/finalize_five_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeFiveScreen.
///
/// This class manages the state of the FinalizeFiveScreen, including the
/// current finalizeFiveModelObj
class FinalizeFiveController extends GetxController {TextEditingController sketchtoimagesController = TextEditingController();

Rx<FinalizeFiveModel> finalizeFiveModelObj = FinalizeFiveModel().obs;

@override void onClose() { super.onClose(); sketchtoimagesController.dispose(); } 
 }
