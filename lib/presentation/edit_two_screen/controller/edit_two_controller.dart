import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

/// A controller class for the EditTwoScreen.
///
/// This class manages the state of the EditTwoScreen, including the
/// current editTwoModelObj
class EditTwoController extends GetxController {
 final GlobalKey globalKey = GlobalKey();
 Uint8List? bdata;

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
}
