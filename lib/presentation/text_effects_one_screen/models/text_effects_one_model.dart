import '../../../core/app_export.dart';
import 'grida_one_item_model.dart';

/// This class defines the variables used in the [text_effects_one_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class TextEffectsOneModel {
 static List<GridaOneItemModel> getTextEffectData(){
   return [
     GridaOneItemModel(ImageConstant.imgtextEffect1,"A",1),
     GridaOneItemModel(ImageConstant.imgtextEffect2,"B",2),
     GridaOneItemModel(ImageConstant.imgtextEffect3,"C",3),
     GridaOneItemModel(ImageConstant.imgtextEffect4,"D",4),
     GridaOneItemModel(ImageConstant.imgtextEffect5,"E",5),
     GridaOneItemModel(ImageConstant.imgtextEffect6,"F",6),
     GridaOneItemModel(ImageConstant.imgtextEffect7,"G",7),
     GridaOneItemModel(ImageConstant.imgtextEffect8,"H",8),
   ];
 }
}
