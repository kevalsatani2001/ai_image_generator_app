import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../profile_one_tab_container_screen/models/popu_up_menu_item_model.dart';
import '../models/art_work_post_pop_up_data.dart';


class ArtworkPostController extends GetxController {
  TextEditingController seedvalueoneController = TextEditingController();

  TextEditingController seednumberoneController = TextEditingController();
  List<PopupmenuItemModel> getArtWorkPopupList =  ArtworkPostPopUpmenuData.getPopupmenuItem();
}
