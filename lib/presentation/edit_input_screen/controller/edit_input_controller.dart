import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/edit_input_screen/models/edit_input_model.dart';import 'package:flutter/material.dart';/// A controller class for the EditInputScreen.
///
/// This class manages the state of the EditInputScreen, including the
/// current editInputModelObj
class EditInputController extends GetxController {TextEditingController seedvalueoneController = TextEditingController();

Rx<EditInputModel> editInputModelObj = EditInputModel().obs;

Rx<bool> eleven = false.obs;

@override void onClose() { super.onClose(); seedvalueoneController.dispose(); } 
 }
