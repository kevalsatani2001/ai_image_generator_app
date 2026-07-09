import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../models/font_family_model.dart';
import '../models/fontfamilydata.dart';

/// A controller class for the EditScreen.
///
/// This class manages the state of the EditScreen, including the
/// current editModelObj
class EditController extends GetxController {
  final GlobalKey globalKey = GlobalKey();
  Uint8List? bdata;
int currentColorIndex = 0;
int currentTextColorIndex = 0;
int selectedBackground = 0;
String currentFontFamily = "Archivo Black Regular";

  List<Color> defaultColors = [
    Color(0XFFFFFFFF),
    Color(0XFFB0C8C1),
    Color(0XFF829EBD),
    Color(0XFF6E65A1),
    Color(0XFF682E70),
    Color(0XFF003E59),
    Color(0XFF534D88),
    Color(0XFFB54E8C),
    Color(0XFFF66161),
    Color(0XFFF6A202),
  ]; List<Color> defaultTextColors = [
    Color(0XFFFFFFFF),
    Color(0XFFD97B23),
    Color(0XFF533916),
    Color(0XFF6E741C),
    Color(0XFF40B0BE),
    Color(0XFF003E59),
    Color(0XFFC31924),
    Color(0XFFE88297),
    Color(0XFFC7CB54),
    Color(0XFF0E336A),
  ];
  List<FontFamilyModel> fontFamilyList = FontFamilyData.getFontFamilyData();

  List blankBackgroungdImnages = [
    ImageConstant.imgBgBlankCirculer1,
    ImageConstant.imgBgBlankCirculer2,
    ImageConstant.imgBgBlankCirculer3,
    ImageConstant.imgBgBlankCirculer4,
    ImageConstant.imgBgBlankCirculer5,
    ImageConstant.imgBgBlankCirculer6,
    ImageConstant.imgBgBlankCirculer7,
    ImageConstant.imgBgBlankCirculer8,
    ImageConstant.imgBgBlankCirculer9,
    ImageConstant.imgBgBlankCirculer10,
    ImageConstant.imgBgBlankCirculer11,
    ImageConstant.imgBgBlankCirculer12,
    ImageConstant.imgBgBlankCirculer13,
    ImageConstant.imgBgBlankCirculer14,
    ImageConstant.imgBgBlankCirculer15,
    ImageConstant.imgBgBlankCirculer16,
  ];
  Future<void> captureAndSaveImage() async {
    print("DSFDFDSFDSF==========${globalKey.currentContext}");
    RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(
        pixelRatio:
            3.0); // You can adjust the pixel ratio as needed for higher quality
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8List = byteData!.buffer.asUint8List();

    bdata = uint8List;
    update();


  }


  void setCurrentColorindex(int index) {
    currentColorIndex = index;
    update();
  }
  void setCurrentTextColorindex(int index) {
    currentTextColorIndex = index;
    update();

  }
}
