import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_nine_screen/models/finalize_nine_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeNineScreen.
///
/// This class manages the state of the FinalizeNineScreen, including the
/// current finalizeNineModelObj
class FinalizeNineController extends GetxController {TextEditingController himselfWhileActController = TextEditingController();

Rx<FinalizeNineModel> finalizeNineModelObj = FinalizeNineModel().obs;

@override void onClose() { super.onClose(); himselfWhileActController.dispose(); } 
 }
