import '../../../core/app_export.dart';

/// This class is used in the [discover_item_widget] screen.

class DiscoverItemModel {
 String? image;
 String? title;
 String? subTitle;
 bool? isFollow;
 int? id;
 String? uid;
 DiscoverItemModel(this.image,this.title,this.subTitle,this.isFollow,this.id, {this.uid});
}
