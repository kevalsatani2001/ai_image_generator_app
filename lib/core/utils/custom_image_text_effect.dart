import 'dart:async';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;




class ImageTextEffect extends StatefulWidget {
  @override
  State<ImageTextEffect> createState() => _ImageTextEffectState();
}

class _ImageTextEffectState extends State<ImageTextEffect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Text Effect Demo'),
        ),
        body: Center(
          child: ImageTextEffect(),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ImageTextEffectWidget extends StatefulWidget {

   ImageTextEffectWidget({super.key,required this.image,required this.text,required this.style});
   String? image;
   String? text;
   TextStyle? style;

  @override
  State<ImageTextEffectWidget> createState() => _ImageTextEffectWidgetState();
}

class _ImageTextEffectWidgetState extends State<ImageTextEffectWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: loadImage(widget.image!), // Replace with your image path
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final imageShader = ui.ImageShader(
            snapshot.data!,
            TileMode.clamp,
            TileMode.clamp,
            Matrix4.identity().storage,
          );
          return ShaderMask(
            shaderCallback: (Rect bounds) => imageShader,
            child:  Text(widget.text!.toUpperCase(),style: widget.style,),
          );
        } else {
          return Padding(
            padding:  EdgeInsets.only(top: 38.v,bottom: 48.v),
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<ui.Image> loadImage(String assetName) async {
    final ByteData data = await rootBundle.load(assetName);
    final Uint8List bytes = data.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(bytes, completer.complete);
    return completer.future;
  }
}

/*
import 'dart:async';
import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_4.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../core/utils/custom_image_text_effect.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../edit_screen/widgets/gridpopinstext_item_widget.dart';
import '../edit_screen/widgets/listview3_item_widget.dart';
import '../text_effects_one_screen/controller/text_effects_one_controller.dart';
import 'controller/edit_controller.dart';
import 'models/gridpopinstext_item_model.dart';
import 'models/listview3_item_model.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';




class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
 EditController editController = Get.put(EditController());
 TextEffectsOneController textEffectsOneController = Get.put(TextEffectsOneController());
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
 ];


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      editController.captureAndSaveImage();});
  }
 @override
 Widget build(BuildContext context) {



  mediaQueryData = MediaQuery.of(context);
  // _globalKey == null?SizedBox():_captureAndSaveImage();

  return  WillPopScope(
      onWillPop: () async{
        Get.back();
        return true;
      },

      child: Scaffold(
          body: ColorfulSafeArea(
            color: appTheme.whiteA700,
            child: GetBuilder<EditController>(
              init: EditController(),
              builder:(controller) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [
                    getCommonAppBar("lbl_edit".tr,actionWidget:  AppbarSubtitle(
                        text: "lbl_finalize".tr,
                        onTap: () {
                          onTapFinalize();
                        })),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.h, bottom: 5.v,top: 24.v,right: 20.h),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [ RepaintBoundary(
                                  key: controller.globalKey,
                                  child:  SizedBox(
                                      height: 374.adaptSize,
                                      width: double.infinity,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgBlankBackground,
                                                height: 374.adaptSize,
                                                width: double.infinity,
                                                radius: BorderRadius.circular(
                                                    8.h),
                                                alignment: Alignment.center),
                                            ImageTextEffectWidget(image: textEffectsOneController.currentTextEffect!.bgImage, text: textEffectsOneController.currentText),

                                          ])),
                                ),
                                      controller.bdata != null ?ValueListenableBuilder(
                                        valueListenable: _filterColor,
                                        builder: (context, color, child) {
                                          return Container(
                                            height: 374.v,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(8.h),
                                                image: DecorationImage(
                                                    image: MemoryImage(controller.bdata!),
                                                    fit: BoxFit.fill,
                                                    colorFilter: ColorFilter.mode(
                                                        color.withOpacity(0.5),
                                                        BlendMode.color))),

                                          );


                                        },
                                      ):SizedBox(),


                                      controller.bdata != null ?  FilterSelector(
                                        onFilterChanged: _onFilterChanged,
                                        filters: _filters, image: MemoryImage(controller.bdata ?? Uint8List(0)), imagesize: 81,

                                      ) : CircularProgressIndicator(),


                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 28.v, right: 32.h),
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("lbl_aspect_ratio".tr,
                                                    style: theme
                                                        .textTheme.titleMedium),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 4.v),
                                                    child: Text("lbl_view_all".tr,
                                                        style: CustomTextStyles
                                                            .bodyMediumGray700))
                                              ])),
                                      // SizedBox(
                                      //     height: 64.v,
                                      //     child: Obx(() => ListView.separated(
                                      //         padding: EdgeInsets.only(
                                      //             top: 16.v, right: 80.h),
                                      //         scrollDirection: Axis.horizontal,
                                      //         separatorBuilder: (context, index) {
                                      //           return SizedBox(width: 16.h);
                                      //         },
                                      //         itemCount: controller
                                      //             .editModelObj
                                      //             .value
                                      //             .listview3ItemList
                                      //             .value
                                      //             .length,
                                      //         itemBuilder: (context, index) {
                                      //           Listview3ItemModel model =
                                      //           controller
                                      //               .editModelObj
                                      //               .value
                                      //               .listview3ItemList
                                      //               .value[index];
                                      //           return Listview3ItemWidget(model);
                                      //         }))),
                                      SizedBox(height: 27.v),
                                      Text("lbl_font".tr,
                                          style: theme.textTheme.titleMedium),
                                      // Padding(
                                      //     padding: EdgeInsets.only(
                                      //         top: 17.v, right: 20.h),
                                      //     child: Obx(() => GridView.builder(
                                      //         shrinkWrap: true,
                                      //         gridDelegate:
                                      //         SliverGridDelegateWithFixedCrossAxisCount(
                                      //             mainAxisExtent: 65.v,
                                      //             crossAxisCount: 2,
                                      //             mainAxisSpacing: 20.h,
                                      //             crossAxisSpacing: 20.h),
                                      //         physics:
                                      //         NeverScrollableScrollPhysics(),
                                      //         itemCount: controller
                                      //             .editModelObj
                                      //             .value
                                      //             .gridpopinstextItemList
                                      //             .value
                                      //             .length,
                                      //         itemBuilder: (context, index) {
                                      //           GridpopinstextItemModel model =
                                      //           controller
                                      //               .editModelObj
                                      //               .value
                                      //               .gridpopinstextItemList
                                      //               .value[index];
                                      //           return GridpopinstextItemWidget(
                                      //               model);
                                      //         }))),
                                      SizedBox(height: 28.v),
                                      Text("msg_back_ground_color".tr,
                                          style: theme.textTheme.titleMedium),

                                      GridView.builder(

                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: defaultColors.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          mainAxisExtent: 54.v,
                                          crossAxisCount: 5,
                                          mainAxisSpacing: 16.h,
                                          crossAxisSpacing: 18.h), itemBuilder: (context, index) {
                                            return  GestureDetector(
                                              onTap: () {
                                                // addNewCategoryController
                                                //     .onChange(color);
                                              },
                                              child:   Container(
                                                  height: 54.adaptSize,
                                                  width: 54.adaptSize,
                                                  decoration: BoxDecoration(
                                                      color: defaultColors[index],
                                                      shape: BoxShape.circle)),


                                            );
                                          },),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 16.v, right: 20.h),
                                          padding: EdgeInsets.all(16.h),
                                          decoration: AppDecoration.fillGray10002
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgEllipse250,
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          radius: BorderRadius
                                                              .circular(27.h)),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray200,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray300,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .blueGray500,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: theme
                                                                  .colorScheme
                                                                  .errorContainer,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h)))
                                                    ]),
                                                SizedBox(height: 16.v),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgFrame34632,
                                                    height: 54.v,
                                                    width: 342.h)
                                              ])),
                                      SizedBox(height: 26.v),
                                      Text("lbl_text_color".tr,
                                          style: theme.textTheme.titleMedium),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 18.v, right: 20.h),
                                          padding: EdgeInsets.all(16.h),
                                          decoration: AppDecoration.fillGray10002
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder8),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      CustomImageView(
                                                          imagePath: ImageConstant
                                                              .imgEllipse25054x54,
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          radius: BorderRadius
                                                              .circular(27.h)),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .yellow900,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .gray800,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .lime900,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h))),
                                                      Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .teal30001,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  27.h)))
                                                    ]),
                                                SizedBox(height: 16.v),
                                                CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgFrame34632Indigo90001,
                                                    height: 54.v,
                                                    width: 342.h)
                                              ]))
                                    ]))))
                  ])),
            ),
          ),
          bottomNavigationBar: Padding(
              padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomOutlinedButton(
                        width: 173.h, text: "lbl_generate".tr),
                    CustomElevatedButton(
                        width: 177.h, text: "lbl_download".tr)
                  ]))));





 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.textEffectsScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.photoToAnimeScreen,
  );
 }
 final _filters = [
   Colors.white,
   ...List.generate(
     Colors.primaries.length,
         (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
   )
 ];
 final _filterColor = ValueNotifier<Color>(Colors.white);

 void _onFilterChanged(Color value) {
   _filterColor.value = value;
 }

//  Future<void> _captureAndSaveImage() async {
//    RenderRepaintBoundary boundary = _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//    ui.Image image = await boundary.toImage(pixelRatio: 3.0); // You can adjust the pixel ratio as needed for higher quality
//    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//    Uint8List uint8List = byteData!.buffer.asUint8List();
//    // String filePath = '/path/to/save/image.png'; // Replace with your desired file path and image format
// //     Directory filePath = await getApplicationDocumentsDirectory();
// //     print("path is ===== $filePath");
// //     String documentsPath = filePath.path;
// //     print('Documents Directory Path: $documentsPath');
// //
// // // Create a File instance and write the Uint8List to it
// //     File file = File(filePath.path);
// //     file.writeAsBytesSync(uint8List);
//
//    setState(() {
//      print("bdata is $uint8List");
//      bdata = uint8List;
//    });
// // Now 'file' contains the image data
// //     print('Image saved as $filePath');
//    // Save the image or perform other actions with it
//    // For example, you can save it to the device's gallery or display it in an `Image` widget.
//    // To display it in an `Image` widget, you can use the `MemoryImage` class:
//    // Image.memory(Uint8List.fromList(uint8List))
//
//    print('Image captured and saved');
//  }
}


 */