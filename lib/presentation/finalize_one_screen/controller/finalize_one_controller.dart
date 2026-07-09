import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/finalize_one_screen/models/finalize_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the FinalizeOneScreen.
///
/// This class manages the state of the FinalizeOneScreen, including the
/// current finalizeOneModelObj
class FinalizeOneController extends GetxController {TextEditingController actionBeautyfulController = TextEditingController();

Rx<FinalizeOneModel> finalizeOneModelObj = FinalizeOneModel().obs;

Rx<bool> isSelectedSwitch = false.obs;

@override void onClose() { super.onClose(); actionBeautyfulController.dispose(); } 
 }
