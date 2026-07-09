import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/images_to_painting_screen/models/images_to_painting_model.dart';/// A controller class for the ImagesToPaintingScreen.
///
/// This class manages the state of the ImagesToPaintingScreen, including the
/// current imagesToPaintingModelObj
class ImagesToPaintingController extends GetxController {Rx<ImagesToPaintingModel> imagesToPaintingModelObj = ImagesToPaintingModel().obs;

 }
