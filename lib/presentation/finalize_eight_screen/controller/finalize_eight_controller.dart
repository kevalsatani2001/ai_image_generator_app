import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_eight_screen/models/finalize_eight_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeEightScreen.
///
/// This class manages the state of the FinalizeEightScreen, including the
/// current finalizeEightModelObj
class FinalizeEightController extends GetxController {TextEditingController womenSketchTextController = TextEditingController();

Rx<FinalizeEightModel> finalizeEightModelObj = FinalizeEightModel().obs;

@override void onClose() { super.onClose(); womenSketchTextController.dispose(); } 
 }
