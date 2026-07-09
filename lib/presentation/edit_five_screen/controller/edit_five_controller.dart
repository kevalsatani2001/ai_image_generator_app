import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:ai_image_generator/core/app_export.dart';import 'package:ai_image_generator/presentation/edit_five_screen/models/edit_five_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';/// A controller class for the EditFiveScreen.
///
/// This class manages the state of the EditFiveScreen, including the
/// current editFiveModelObj
class EditFiveController extends GetxController {Rx<EditFiveModel> editFiveModelObj = EditFiveModel().obs;

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


final filters = [
 Colors.white,
 ...List.generate(
  Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
 )
];
final filterColor = ValueNotifier<Color>(Colors.white);

void onFilterChanged(Color value) {
 filterColor.value = value;
 update();
}

}
