import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/discover_tab_container_page/models/discover_tab_container_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the DiscoverTabContainerPage.
///
/// This class manages the state of the DiscoverTabContainerPage, including the
/// current discoverTabContainerModelObj
class DiscoverTabContainerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  DiscoverTabContainerController(this.discoverTabContainerModelObj);

  TextEditingController searchController = TextEditingController();

  Rx<DiscoverTabContainerModel> discoverTabContainerModelObj;

  late TabController tabviewController =
  TabController(vsync: this, length: 2);

}
