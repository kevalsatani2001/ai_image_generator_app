import '../../../core/app_export.dart';/// This class is used in the [usernotificatio_item_widget] screen.
class UsernotificatioItemModel {UsernotificatioItemModel({this.notificationTex, this.notificationTim, this.id, }) { notificationTex = notificationTex  ?? Rx("Is there any free AI image generator");notificationTim = notificationTim  ?? Rx("2 Min");id = id  ?? Rx(""); }

Rx<String>? notificationTex;

Rx<String>? notificationTim;

Rx<String>? id;

 }
