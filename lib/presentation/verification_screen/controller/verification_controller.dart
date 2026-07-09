import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/verification_screen/models/verification_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the VerificationScreen.
import 'package:sms_autofill/sms_autofill.dart';

///
/// This class manages the state of the VerificationScreen, including the
/// current verificationModelObj
class VerificationController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;



  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }


}
