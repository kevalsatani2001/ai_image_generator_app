import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/erase_object_screen/models/erase_object_model.dart';/// A controller class for the EraseObjectScreen.
///
/// This class manages the state of the EraseObjectScreen, including the
/// current eraseObjectModelObj
class EraseObjectController extends GetxController {Rx<EraseObjectModel> eraseObjectModelObj = EraseObjectModel().obs;

 }
