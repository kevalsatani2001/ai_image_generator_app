import '../../../core/app_export.dart';import 'profile_liked_item_model.dart';/// This class defines the variables used in the [profile_liked_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileLikedModel {Rx<List<ProfileLikedItemModel>> profileLikedItemList = Rx(List.generate(3,(index) => ProfileLikedItemModel()));

 }
