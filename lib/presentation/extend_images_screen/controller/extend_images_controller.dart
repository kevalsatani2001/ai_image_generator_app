import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the ExtendImagesScreen.
///
/// This class manages the state of the ExtendImagesScreen, including the
/// current extendImagesModelObj
class ExtendImagesController extends GetxController {
  XFile? images;
TextEditingController imageWidthController = TextEditingController();
TextEditingController imageHeightController = TextEditingController();
  double imageWidth = 200.0;
  double imageHeight = 200.0;
}
