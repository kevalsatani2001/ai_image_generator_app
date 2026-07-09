import '../../../core/app_export.dart';/// This class is used in the [listview_item_widget] screen.
class ListviewItemModel {ListviewItemModel({required this.checkBoxValue, this.id, }) { id = id  ?? Rx(""); }

Rx<bool> checkBoxValue = Rx(false);

Rx<String>? id;

 }
