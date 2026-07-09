import '../../../core/app_export.dart';

/// This class is used in the [artstyle2_item_widget] screen.

class Artstyle2ItemModel {
  Artstyle2ItemModel({
    this.aiavatargenerat,
    this.id,
  }) {
    aiavatargenerat = aiavatargenerat ?? Rx("AI avatar generator");
    id = id ?? Rx("");
  }

  Rx<String>? aiavatargenerat;

  Rx<String>? id;
}
