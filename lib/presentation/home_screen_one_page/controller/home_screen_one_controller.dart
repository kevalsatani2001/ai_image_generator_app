import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/home_screen_one_page/models/home_screen_one_model.dart';import 'package:flutter/material.dart';/// A controller class for the HomeScreenOnePage.
///
/// This class manages the state of the HomeScreenOnePage, including the
/// current homeScreenOneModelObj
class HomeScreenOneController extends GetxController {HomeScreenOneController(this.homeScreenOneModelObj);

TextEditingController typeanythingController = TextEditingController();

Rx<HomeScreenOneModel> homeScreenOneModelObj;

@override void onClose() { super.onClose(); typeanythingController.dispose(); } 
 }
