import '../../../core/app_export.dart';import 'listview2_item_model.dart';/// This class defines the variables used in the [anime_generator_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AnimeGeneratorModel {Rx<List<Listview2ItemModel>> listview2ItemList = Rx(List.generate(4,(index) => Listview2ItemModel(checkBoxValue: false.obs)));

 }
