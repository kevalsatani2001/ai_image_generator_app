import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_one_tab_container_screen/models/popu_up_menu_item_model.dart';

class PopupmenuItems{
  static List<PopupmenuItemModel> getPopupmenuItem(){
    return [
      PopupmenuItemModel(ImageConstant.imgCopyIcon,"Copy profile URL"),
      PopupmenuItemModel(ImageConstant.imgDownloadIcon,"Show QR code"),
      PopupmenuItemModel(ImageConstant.imgShareProfileIcon,"Share this profile"),
      PopupmenuItemModel(ImageConstant.imgReportIcon,"Report"),
    ];
  }
}