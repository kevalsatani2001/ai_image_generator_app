import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/batch_art_generator_screen/models/batch_art_generator_model.dart';/// A controller class for the BatchArtGeneratorScreen.
///
/// This class manages the state of the BatchArtGeneratorScreen, including the
/// current batchArtGeneratorModelObj
class BatchArtGeneratorController extends GetxController {Rx<BatchArtGeneratorModel> batchArtGeneratorModelObj = BatchArtGeneratorModel().obs;

 }
