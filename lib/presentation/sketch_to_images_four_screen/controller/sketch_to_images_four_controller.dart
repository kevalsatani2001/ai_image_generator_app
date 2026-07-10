import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';

/// A controller class for the SketchToImagesFourScreen.
///
/// This class manages the state of the SketchToImagesFourScreen, including the
/// current sketchToImagesFourModelObj
class SketchToImagesFourController extends GetxController {
  TextEditingController promtController = TextEditingController();

  Rx<bool> eleven = false.obs;
}
