import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/sketch_to_images_screen/models/sketch_to_images_model.dart';/// A controller class for the SketchToImagesScreen.
///
/// This class manages the state of the SketchToImagesScreen, including the
/// current sketchToImagesModelObj
class SketchToImagesController extends GetxController {Rx<SketchToImagesModel> sketchToImagesModelObj = SketchToImagesModel().obs;

 }
