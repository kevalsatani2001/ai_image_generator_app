import '../../../core/app_export.dart';
import 'discover_item_model.dart';

/// This class defines the variables used in the [discover_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DiscoverModel {
static List<DiscoverItemModel> getCreaterData(){
  return [
    DiscoverItemModel(ImageConstant.imgCreater1,"Aida.Bugg","Aida Bugg",true,1),
    DiscoverItemModel(ImageConstant.imgCreater2,"Ronald_Richards","Ronald Richards",true,2),
    DiscoverItemModel(ImageConstant.imgCreater3,"Jane.Cooper","Jane Cooper",true,3),
    DiscoverItemModel(ImageConstant.imgCreater4,"Floyd_Mildes","Floyd Miles",true,4),
    DiscoverItemModel(ImageConstant.imgCreater5,"Guy.Hawkins","Guy Hawkins",false,5),
    DiscoverItemModel(ImageConstant.imgCreater6,"Annette.black","Annette Black",true,6),
  ];
}
}
