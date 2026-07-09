import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_six_screen/models/finalize_six_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeSixScreen.
///
/// This class manages the state of the FinalizeSixScreen, including the
/// current finalizeSixModelObj
class FinalizeSixController extends GetxController {TextEditingController appnameoneController = TextEditingController();

Rx<FinalizeSixModel> finalizeSixModelObj = FinalizeSixModel().obs;

@override void onClose() { super.onClose(); appnameoneController.dispose(); } 
 }
