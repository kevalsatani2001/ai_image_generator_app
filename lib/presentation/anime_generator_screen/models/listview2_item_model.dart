import '../../../core/app_export.dart';/// This class is used in the [listview2_item_widget] screen.
class Listview2ItemModel {Listview2ItemModel({required this.checkBoxValue, this.id, }) { id = id  ?? Rx(""); }

Rx<bool> checkBoxValue = Rx(false);

Rx<String>? id;

 }
