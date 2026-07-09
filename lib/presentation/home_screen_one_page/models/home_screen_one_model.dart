import '../../../core/app_export.dart';import 'listview_item_model.dart';/// This class defines the variables used in the [home_screen_one_page],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeScreenOneModel {Rx<List<ListviewItemModel>> listviewItemList = Rx(List.generate(4,(index) => ListviewItemModel(checkBoxValue: false.obs)));

 }
