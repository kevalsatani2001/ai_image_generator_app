import '../../../core/app_export.dart';
import 'aspect_ratio_model.dart';
import 'listview1_item_model.dart';

/// This class defines the variables used in the [home_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class HomeModel {
  Rx<List<Listview1ItemModel>> listview1ItemList =
      Rx(List.generate(4, (index) => Listview1ItemModel(checkboxValue: false.obs)));


  static List<AspectRatioModel> getAspectRatioList(){
    return [
      AspectRatioModel(ImageConstant.img1_1,"1 : 1",1),
      AspectRatioModel(ImageConstant.img9_16,"9 : 16",2),
      AspectRatioModel(ImageConstant.img16_9,"16 : 9",3),
      AspectRatioModel(ImageConstant.img3_04,"3 : 04",4),
    ];
  }
}
