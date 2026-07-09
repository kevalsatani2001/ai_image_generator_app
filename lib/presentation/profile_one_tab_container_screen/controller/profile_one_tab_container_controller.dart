import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/profile_one_tab_container_screen/models/profile_one_tab_container_model.dart';
import 'package:flutter/material.dart';

import '../models/pop_up_menu_items.dart';
import '../models/popu_up_menu_item_model.dart';

/// A controller class for the ProfileOneTabContainerScreen.
///
/// This class manages the state of the ProfileOneTabContainerScreen, including the
/// current profileOneTabContainerModelObj
class ProfileOneTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();


  List<PopupmenuItemModel> popupMenuItemList = PopupmenuItems.getPopupmenuItem();
  late TabController tabviewController = TabController(vsync: this, length: 2);
  PageController pageController = PageController();

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }
}
