import '../../../core/app_export.dart';import 'artstyle1_item_model.dart';/// This class defines the variables used in the [art_styles_selected_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtStylesSelectedModel {Rx<List<Artstyle1ItemModel>> artstyle1ItemList = Rx(List.generate(6,(index) => Artstyle1ItemModel()));

 }
