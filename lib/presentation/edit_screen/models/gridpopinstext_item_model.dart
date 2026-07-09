import '../../../core/app_export.dart';/// This class is used in the [gridpopinstext_item_widget] screen.
class GridpopinstextItemModel {GridpopinstextItemModel({this.popinsText, this.id, }) { popinsText = popinsText  ?? Rx("Popins");id = id  ?? Rx(""); }

Rx<String>? popinsText;

Rx<String>? id;

 }
