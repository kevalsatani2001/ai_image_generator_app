import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../model/input_image_data.dart';
import '../model/input_image_model.dart';

class InputImagesController extends GetxController{
  TextEditingController searchController = TextEditingController();
  // List<XFile>? uplodedimage = [];
  List<InputImageModel>uplodedimage =  InputImageData.getInputImageData();

}