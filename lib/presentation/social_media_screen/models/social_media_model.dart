import '../../../core/app_export.dart';
import 'appbar_item_model.dart';
import 'header_item_model.dart';

/// This class defines the variables used in the [social_media_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SocialMediaModel {
 static List<HeaderItemModel> getSocialMediaList(){
   return [
     HeaderItemModel(ImageConstant.imgXicon,"X",1),
     HeaderItemModel(ImageConstant.imgInstagramIcon,"Instagram",2),
     HeaderItemModel(ImageConstant.imgDiscordIcon,"Discord",3),
     HeaderItemModel(ImageConstant.imgRedditIcon,"Reddit",4),
     HeaderItemModel(ImageConstant.imgTelegramIcon,"Telegram",5),
     HeaderItemModel(ImageConstant.imgDiscordIcon,"Youtube",6),
   ];
 }
}
