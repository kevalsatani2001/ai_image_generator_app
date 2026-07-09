import 'package:ai_image_generator/core/app_export.dart';

import '../../profile_one_tab_container_screen/models/popu_up_menu_item_model.dart';

class ArtworkPostPopUpmenuData{
  static List<PopupmenuItemModel> getPopupmenuItem(){
    return [
      PopupmenuItemModel(ImageConstant.imgSave,"Save art"),
      PopupmenuItemModel(ImageConstant.imgDownloadIcon,"Download art"),
      PopupmenuItemModel(ImageConstant.imgReportIcon,"Report"),
    ];
  }
}