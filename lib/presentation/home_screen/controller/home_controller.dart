import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/home_screen/models/home_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/aspect_ratio_model.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current homeModelObj
class HomeController extends GetxController {
  Rx<HomeModel> homeModelObj = HomeModel().obs;
  TextEditingController typeanythingController = TextEditingController();
  List<AspectRatioModel> aspectRatioList = HomeModel.getAspectRatioList();
int? currentSizeId;
  void setCurrentSize(int? id) {
    currentSizeId = id!;
    update();
  }
}
