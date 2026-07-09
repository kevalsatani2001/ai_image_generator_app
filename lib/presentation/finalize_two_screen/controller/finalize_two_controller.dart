import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_two_screen/models/finalize_two_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeTwoScreen.
///
/// This class manages the state of the FinalizeTwoScreen, including the
/// current finalizeTwoModelObj
class FinalizeTwoController extends GetxController {TextEditingController actionBeautyfulController = TextEditingController();

Rx<FinalizeTwoModel> finalizeTwoModelObj = FinalizeTwoModel().obs;

@override void onClose() { super.onClose(); actionBeautyfulController.dispose(); } 
 }
