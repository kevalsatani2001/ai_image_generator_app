import '../../../core/app_export.dart';import 'profile_created_item_model.dart';/// This class defines the variables used in the [profile_created_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileCreatedModel {Rx<List<ProfileCreatedItemModel>> profileCreatedItemList = Rx(List.generate(4,(index) => ProfileCreatedItemModel()));

 }
