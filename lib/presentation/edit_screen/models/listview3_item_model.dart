import '../../../core/app_export.dart';

/// This class is used in the [listview3_item_widget] screen.

class Listview3ItemModel {
  Listview3ItemModel({
    required this.checkboxValue,
    this.id,
  }) {
    id = id ?? Rx("");
  }

  Rx<bool> checkboxValue = Rx(false);

  Rx<String>? id;
}
