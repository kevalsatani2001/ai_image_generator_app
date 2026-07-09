import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/more_popup_tab_container_screen/models/more_popup_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the MorePopupTabContainerScreen.
///
/// This class manages the state of the MorePopupTabContainerScreen, including the
/// current morePopupTabContainerModelObj
class MorePopupTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {Rx<MorePopupTabContainerModel> morePopupTabContainerModelObj = MorePopupTabContainerModel().obs;

late TabController tabviewController = Get.put(TabController(vsync: this, length: 2));

 }
