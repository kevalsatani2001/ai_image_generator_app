import '../../../core/app_export.dart';
import 'artstyle_item_model.dart';

/// This class defines the variables used in the [art_styles_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ArtStylesModel {
 static List<ArtstyleItemModel> getArtStyleData(){
  return [
   ArtstyleItemModel(ImageConstant.imgArtStyle1,"The colourfull","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",1),
   ArtstyleItemModel(ImageConstant.imgArtStyle2,"Painting","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",2),
   ArtstyleItemModel(ImageConstant.imgArtStyle3,"Sculpture","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",3),
   ArtstyleItemModel(ImageConstant.imgArtStyle4,"Literature","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",4),
   ArtstyleItemModel(ImageConstant.imgArtStyle5,"Architecture","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",5),
   ArtstyleItemModel(ImageConstant.imgArtStyle6,"Cinema","There are many variations of passages of Lorem Ipsum available, but the majority have suffered   or randomised words which don't look..",6),
  ];
 }
}
