import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_ten_screen/models/finalize_ten_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeTenScreen.
///
/// This class manages the state of the FinalizeTenScreen, including the
/// current finalizeTenModelObj
class FinalizeTenController extends GetxController {TextEditingController flowerphotoController = TextEditingController();

Rx<FinalizeTenModel> finalizeTenModelObj = FinalizeTenModel().obs;

@override void onClose() { super.onClose(); flowerphotoController.dispose(); } 
 }
