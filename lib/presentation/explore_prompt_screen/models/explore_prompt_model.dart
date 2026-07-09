import '../../../core/app_export.dart';
import '../../art_styles_screen/models/artstyle_item_model.dart';
import 'explore_prompt_item_model.dart';

/// This class defines the variables used in the [explore_prompt_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ExplorePromptModel {
 static List<ArtstyleItemModel> getExplorePromptData(){
  return [
   ArtstyleItemModel(ImageConstant.imgExplorePrompt1,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",1),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt2,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",2),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt3,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",3),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt4,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",4),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt5,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",5),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt6,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",6),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt7,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",7),
   ArtstyleItemModel(ImageConstant.imgExplorePrompt8,"","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",8),
  ];
 }
}
