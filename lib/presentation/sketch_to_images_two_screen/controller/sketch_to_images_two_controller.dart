import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/sketch_to_images_two_screen/models/sketch_to_images_two_model.dart';import 'package:flutter/material.dart';/// A controller class for the SketchToImagesTwoScreen.
///
/// This class manages the state of the SketchToImagesTwoScreen, including the
/// current sketchToImagesTwoModelObj
class SketchToImagesTwoController extends GetxController {TextEditingController birdoneController = TextEditingController();

Rx<SketchToImagesTwoModel> sketchToImagesTwoModelObj = SketchToImagesTwoModel().obs;

@override void onClose() { super.onClose(); birdoneController.dispose(); } 
 }
