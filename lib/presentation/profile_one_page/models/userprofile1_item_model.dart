import '../../../core/app_export.dart';/// This class is used in the [userprofile1_item_widget] screen.
class Userprofile1ItemModel {Userprofile1ItemModel({this.userName, this.userDescription, this.id, }) { userName = userName  ?? Rx("Aida.Bugg");userDescription = userDescription  ?? Rx("Aida Bugg");id = id  ?? Rx(""); }

Rx<String>? userName;

Rx<String>? userDescription;

Rx<String>? id;

 }
