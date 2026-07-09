import '../../../core/app_export.dart';import 'more_popup_item_model.dart';/// This class defines the variables used in the [more_popup_page],
/// and is typically used to hold data that is passed between different parts of the application.
class MorePopupModel {Rx<List<MorePopupItemModel>> morePopupItemList = Rx(List.generate(3,(index) => MorePopupItemModel()));

 }
