import '../../../core/app_export.dart';/// This class is used in the [gridusertext_item_widget] screen.
class GridusertextItemModel {GridusertextItemModel({this.userText, this.id, }) { userText = userText  ?? Rx("Hefe");id = id  ?? Rx(""); }

Rx<String>? userText;

Rx<String>? id;

 }
