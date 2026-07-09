import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/profile_tab_container_page/models/profile_tab_container_model.dart';import 'package:flutter/material.dart';/// A controller class for the ProfileTabContainerPage.
///
/// This class manages the state of the ProfileTabContainerPage, including the
/// current profileTabContainerModelObj
class ProfileTabContainerController extends GetxController with  GetSingleTickerProviderStateMixin {ProfileTabContainerController(this.profileTabContainerModelObj);

Rx<ProfileTabContainerModel> profileTabContainerModelObj;

late TabController tabviewController = TabController(vsync: this, length: 3);
PageController pageController = PageController();

 }
