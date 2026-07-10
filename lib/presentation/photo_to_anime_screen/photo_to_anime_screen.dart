import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:ai_image_generator/widgets/custom_text_form_field.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../edit_screen/controller/edit_controller.dart';
import 'controller/photo_to_anime_controller.dart';




class PhotoToAnimeScreen extends StatefulWidget {
  const PhotoToAnimeScreen({super.key});

  @override
  State<PhotoToAnimeScreen> createState() => _PhotoToAnimeScreenState();
}

class _PhotoToAnimeScreenState extends State<PhotoToAnimeScreen> {
  PhotoToAnimeController controller = Get.put(PhotoToAnimeController());
  EditController editControllers = Get.put(EditController());
  // Uint8List? bdata;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return ColorfulSafeArea(
      color: Colors.white,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: GetBuilder<EditController>(
              init: EditController(),
              builder:(editController) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [

                    getCommonAppBar("lbl_finalize".tr),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 24.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              editController.bdata == null ?Center(child: Container(
                                  height: 374.v,
                                  width: double.infinity,
                                  child: CircularProgressIndicator())):Image.memory(editController.bdata!),
                              SizedBox(height: 26.v),
                              Text("lbl_add_title".tr,
                                  style: theme.textTheme.titleMedium),
                              SizedBox(height: 18.v),
                              CustomTextFormField(
                                  controller: controller.editartworkoneController,
                                  hintText: "msg_beautyful_girl_edit".tr,
                                  textInputAction: TextInputAction.done),
                              SizedBox(height: 5.v)
                            ]))
                  ])),
            ),
            bottomNavigationBar: Container(
                margin: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
                decoration: AppDecoration.white,
                child: Container(
                    decoration: AppDecoration.white,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomOutlinedButton(
                              width: 173.h, text: "lbl_share".tr),
                          CustomElevatedButton(
                            onTap: (){
                              getDownloadDialogue(context,(){});
                            },
                              width: 177.h, text: "lbl_download".tr)
                        ])))));
  }

  onTapFinalize() {
    Get.toNamed(
      AppRoutes.editScreen,
    );
  }


//
//   Future<void> _captureAndSaveImage() async {
//     RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//     ui.Image image = await boundary.toImage(pixelRatio: 3.0); // You can adjust the pixel ratio as needed for higher quality
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     Uint8List uint8List = byteData!.buffer.asUint8List();
//     // String filePath = '/path/to/save/image.png'; // Replace with your desired file path and image format
// //     Directory filePath = await getApplicationDocumentsDirectory();
// //     print("path is ===== $filePath");
// //     String documentsPath = filePath.path;
// //     print('Documents Directory Path: $documentsPath');
// //
// // // Create a File instance and write the Uint8List to it
// //     File file = File(filePath.path);
// //     file.writeAsBytesSync(uint8List);
//
//     setState(() {
//       print("bdata is $uint8List");
//       bdata = uint8List;
//     });
// // Now 'file' contains the image data
// //     print('Image saved as $filePath');
//     // Save the image or perform other actions with it
//     // For example, you can save it to the device's gallery or display it in an `Image` widget.
//     // To display it in an `Image` widget, you can use the `MemoryImage` class:
//     // Image.memory(Uint8List.fromList(uint8List))
//
//     print('Image captured and saved');
//   }
}






