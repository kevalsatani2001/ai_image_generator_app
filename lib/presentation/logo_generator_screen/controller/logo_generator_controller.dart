import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/logo_generator_screen/models/logo_generator_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LogoGeneratorScreen.
import 'package:sms_autofill/sms_autofill.dart';

///
/// This class manages the state of the LogoGeneratorScreen, including the
/// current logoGeneratorModelObj
class LogoGeneratorController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<LogoGeneratorModel> logoGeneratorModelObj = LogoGeneratorModel().obs;
TextEditingController promtController = TextEditingController();
  Rx<bool> eleven = false.obs;
  int currentColorIndex = 0;
  List<Color> defaultColors = [
   Color(0XFFFFFFFF),
   Color(0XFFB0C8C1),
   Color(0XFF829EBD),
   Color(0XFF6E65A1),
   Color(0XFF682E70),
   Color(0XFF003E59),
   Color(0XFF534D88),
   Color(0XFFB54E8C),
   Color(0XFFF66161),
   Color(0XFFF6A202),
  ];

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }
  void setCurrentColorindex(int index) {
    currentColorIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }
}
