import '../../../core/app_export.dart';
import '../../art_styles_screen/models/artstyle_item_model.dart';

/// This class defines the variables used in the [toolbox_ai_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ToolboxAiModel {
  static List<ArtstyleItemModel> gettoolboxaiData(){
   return [
    ArtstyleItemModel(ImageConstant.imgToolboxAi1,"AI avatar generator","",1),
    ArtstyleItemModel(ImageConstant.imgToolboxAi2,"Anime generator","",2),
    ArtstyleItemModel(ImageConstant.imgToolboxAi3,"Photo to anime","",3),
    ArtstyleItemModel(ImageConstant.imgToolboxAi4,"The colourfull","",4),
    ArtstyleItemModel(ImageConstant.imgToolboxAi5,"Realistic generetor","",5),
    ArtstyleItemModel(ImageConstant.imgToolboxAi6,"Text effects","",6),
    ArtstyleItemModel(ImageConstant.imgToolboxAi7,"Sketch to images","",7),
    ArtstyleItemModel(ImageConstant.imgToolboxAi8,"Images to painting","",8),
    ArtstyleItemModel(ImageConstant.imgToolboxAi9,"Recolor images","",9),
    ArtstyleItemModel(ImageConstant.imgToolboxAi10,"Extend images","",10),
    ArtstyleItemModel(ImageConstant.imgToolboxAi11,"3D to images","",11),
    ArtstyleItemModel(ImageConstant.imgToolboxAi12,"Text to patten","",12),
    ArtstyleItemModel(ImageConstant.imgToolboxAi13,"Logo generator","",13),
    ArtstyleItemModel(ImageConstant.imgToolboxAi14,"Controinet","",14),
    ArtstyleItemModel(ImageConstant.imgToolboxAi15,"Batch art generator","",15),
   ];
  }
}
