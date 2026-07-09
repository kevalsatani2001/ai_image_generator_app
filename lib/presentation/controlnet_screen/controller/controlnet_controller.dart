import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/controlnet_screen/models/controlnet_model.dart';/// A controller class for the ControlnetScreen.
///
/// This class manages the state of the ControlnetScreen, including the
/// current controlnetModelObj
class ControlnetController extends GetxController {Rx<ControlnetModel> controlnetModelObj = ControlnetModel().obs;

 }
