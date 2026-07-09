import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

/// A controller class for the DToImagesScreen.
///
/// This class manages the state of the DToImagesScreen, including the
/// current dToImagesModelObj
class DToImagesController extends GetxController {
 XFile? images;
 TextEditingController promtController  = TextEditingController();
}
