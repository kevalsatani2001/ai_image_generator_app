import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/ai_avtar_generator_screen/models/ai_avtar_generator_model.dart';
import 'package:ai_image_generator/presentation/ai_avtar_generator_two_screen/models/ai_avtar_generator_two_model.dart';

/// A controller class for the AiAvtarGeneratorTwoScreen.
///
/// This class manages the state of the AiAvtarGeneratorTwoScreen, including the
/// current aiAvtarGeneratorTwoModelObj
class AiAvtarGeneratorTwoController extends GetxController {
  Rx<AiAvtarGeneratorTwoModel> aiAvtarGeneratorTwoModelObj =
      AiAvtarGeneratorTwoModel().obs;


}
