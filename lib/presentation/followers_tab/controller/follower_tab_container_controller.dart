import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FollowersTabContainerController extends GetxController  with GetSingleTickerProviderStateMixin{
  TextEditingController searchController = TextEditingController();
  late TabController tabviewController =
  TabController(vsync: this, length: 2);

}