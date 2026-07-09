import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/successful_screen/models/successful_model.dart';/// A controller class for the SuccessfulScreen.
///
/// This class manages the state of the SuccessfulScreen, including the
/// current successfulModelObj
class SuccessfulController extends GetxController {Rx<SuccessfulModel> successfulModelObj = SuccessfulModel().obs;

 }
