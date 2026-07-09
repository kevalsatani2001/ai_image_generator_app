import '../../../core/app_export.dart';import 'edit_artwork_item_model.dart';/// This class defines the variables used in the [edit_artwork_two_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditArtworkTwoModel {Rx<List<EditArtworkItemModel>> editArtworkItemList = Rx(List.generate(4,(index) => EditArtworkItemModel()));

 }
