import '../../../core/app_export.dart';import 'listview3_item_model.dart';import 'gridpopinstext_item_model.dart';/// This class defines the variables used in the [edit_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class EditModel {Rx<List<Listview3ItemModel>> listview3ItemList = Rx(List.generate(4,(index) => Listview3ItemModel(checkboxValue: false.obs)));

Rx<List<GridpopinstextItemModel>> gridpopinstextItemList = Rx(List.generate(6,(index) => GridpopinstextItemModel()));

 }
