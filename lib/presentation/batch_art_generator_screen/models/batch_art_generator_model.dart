import '../../../core/app_export.dart';import 'batch_art_item_model.dart';/// This class defines the variables used in the [batch_art_generator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class BatchArtGeneratorModel {Rx<List<BatchArtItemModel>> batchArtItemList = Rx(List.generate(8,(index) => BatchArtItemModel()));

 }
