import '../../../core/app_export.dart';

/// This class is used in the [listview1_item_widget] screen.

class Listview1ItemModel {
  Listview1ItemModel({
    required this.checkboxValue,
    this.id,
  }) {
    id = id ?? Rx("");
  }

  Rx<bool> checkboxValue = Rx(false);

  Rx<String>? id;
}
