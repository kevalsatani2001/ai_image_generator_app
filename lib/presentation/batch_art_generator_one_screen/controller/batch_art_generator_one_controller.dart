import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/batch_art_generator_one_screen/models/batch_art_generator_one_model.dart';/// A controller class for the BatchArtGeneratorOneScreen.
///
/// This class manages the state of the BatchArtGeneratorOneScreen, including the
/// current batchArtGeneratorOneModelObj
class BatchArtGeneratorOneController extends GetxController {Rx<BatchArtGeneratorOneModel> batchArtGeneratorOneModelObj = BatchArtGeneratorOneModel().obs;

Rx<bool> eleven = false.obs;

 }
