import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/discover_creator_screen/models/discover_creator_model.dart';import 'package:flutter/material.dart';/// A controller class for the DiscoverCreatorScreen.
///
/// This class manages the state of the DiscoverCreatorScreen, including the
/// current discoverCreatorModelObj
class DiscoverCreatorController extends GetxController {TextEditingController searchController = TextEditingController();

Rx<DiscoverCreatorModel> discoverCreatorModelObj = DiscoverCreatorModel().obs;

@override void onClose() { super.onClose(); searchController.dispose(); } 
 }
