import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/sketch_to_images_four_screen/models/sketch_to_images_four_model.dart';
import 'package:flutter/cupertino.dart';

/// A controller class for the SketchToImagesFourScreen.
///
/// This class manages the state of the SketchToImagesFourScreen, including the
/// current sketchToImagesFourModelObj
class SketchToImagesFourController extends GetxController {
  TextEditingController promtController = TextEditingController();

  Rx<bool> eleven = false.obs;
}
