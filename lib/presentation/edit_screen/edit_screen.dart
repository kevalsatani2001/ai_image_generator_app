import 'dart:async';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/presentation/edit_screen/widgets/gridpopinstext_item_widget.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../../core/utils/custom_image_text_effect.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import '../text_effects_one_screen/controller/text_effects_one_controller.dart';
import 'controller/edit_controller.dart';
import 'models/font_family_model.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  EditController editController = Get.put(EditController());
  TextEffectsOneController textEffectsOneController =
      Get.put(TextEffectsOneController());
  String color1st = "";
  String color2nd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      // editController.captureAndSaveImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    // _globalKey == null?SizedBox():_captureAndSaveImage();

    return WillPopScope(
        onWillPop: () async {
          Get.back();
          return true;
        },
        child: Scaffold(
            body: ColorfulSafeArea(
              color: appTheme.whiteA700,
              child: GetBuilder<EditController>(
                init: EditController(),
                builder: (controller) => SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("lbl_edit".tr,
                          actionWidget: AppbarSubtitle(
                              text: "lbl_finalize".tr,
                              onTap: () {
                                controller.captureAndSaveImage();
                                onTapFinalize();
                              })),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 5.v, top: 24.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: RepaintBoundary(
                                            key: controller.globalKey,
                                            child: SizedBox(
                                                height: 374.adaptSize,
                                                width: double.infinity,
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      controller.currentColorIndex ==
                                                              0
                                                          ? ValueListenableBuilder(
                                                              valueListenable:
                                                                  _filterColor,
                                                              builder: (BuildContext
                                                                      context,
                                                                  Color value,
                                                                  Widget?
                                                                      child) {
                                                                return CustomImageView(
                                                                    imagePath: controller.blankBackgroungdImnages[
                                                                        controller
                                                                            .selectedBackground],
                                                                    height: 374
                                                                        .adaptSize,
                                                                    width: double
                                                                        .infinity,
                                                                    radius: BorderRadius
                                                                        .circular(8
                                                                            .h),
                                                                    alignment:
                                                                        Alignment
                                                                            .center);
                                                              },
                                                            )
                                                          : Container(
                                                              height: 374.h,
                                                              width: double
                                                                  .infinity,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(8
                                                                              .h),
                                                                  color: controller
                                                                          .defaultColors[
                                                                      controller
                                                                          .currentColorIndex]),
                                                            ),
                                                      Center(
                                                        child: ImageTextEffectWidget(
                                                          image: textEffectsOneController
                                                              .currentTextEffect!
                                                              .bgImage,
                                                          text:
                                                              textEffectsOneController
                                                                  .currentText,
                                                          style: TextStyle(
                                                              color: controller.defaultTextColors[controller.currentTextColorIndex],
                                                              fontFamily:controller.currentFontFamily,
                                                              fontSize: 90.fSize,
                                                              fontWeight: FontWeight.w500
                                                          )
                                                        ),
                                                      ),

                                                      // CustomImageView(
                                                      //     imagePath:
                                                      //     ImageConstant.imgWorld,
                                                      //     height: 104.v,
                                                      //     width: 301.h,
                                                      //     alignment: Alignment.center)
                                                    ])),
                                          ),
                                        ),
                                        // ValueListenableBuilder(
                                        //   valueListenable: _filterColor,
                                        //   builder: (context, color, child) {
                                        //     return Container(
                                        //       height: 374.v,
                                        //       width: double.infinity,
                                        //       decoration: BoxDecoration(
                                        //           borderRadius:
                                        //               BorderRadius.circular(
                                        //                   8.h),
                                        //           image: DecorationImage(
                                        //               image: MemoryImage(
                                        //                   controller.bdata!),
                                        //               fit: BoxFit.fill,
                                        //               colorFilter:
                                        //                   ColorFilter.mode(
                                        //                       color.withOpacity(
                                        //                           0.5),
                                        //                       BlendMode
                                        //                           .color))),
                                        //     );
                                        //   },
                                        // ),
                                        //
                                        // SizedBox(height: 24.v),
                                        // controller.bdata != null
                                        //     ? FilterSelector(
                                        //         onFilterChanged:
                                        //             _onFilterChanged,
                                        //         filters: _filters,
                                        //         image: MemoryImage(
                                        //             controller.bdata ??
                                        //                 Uint8List(0)),
                                        //         imagesize: 81,
                                        //       )
                                        //     : CircularProgressIndicator(),
                                        SizedBox(height: 24.v,),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 9.5),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    controller
                                                        .blankBackgroungdImnages
                                                        .length, (index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      controller
                                                              .selectedBackground =
                                                          index;
                                                      controller.update();
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.5),
                                                      child: Container(
                                                        height: 78.v,
                                                        width: 78.h,
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(8
                                                                            .h),
                                                                border: Border.all(
                                                                    color: controller.selectedBackground ==
                                                                            index
                                                                        ? appTheme
                                                                            .blue
                                                                        : Colors
                                                                            .transparent),
                                                                image:
                                                                    DecorationImage(
                                                                  image:
                                                                      AssetImage(
                                                                    controller
                                                                            .blankBackgroungdImnages[
                                                                        index],
                                                                  ),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )),
                                                        child:   Center(
                                                          child: ImageTextEffectWidget(
                                                            image: textEffectsOneController
                                                                .currentTextEffect!
                                                                .bgImage,
                                                            text:
                                                            textEffectsOneController
                                                                .currentText,
                                                            style: TextStyle(
                                                                color: controller.defaultTextColors[controller.currentTextColorIndex],
                                                                fontFamily: controller.currentFontFamily,
                                                                fontSize: 16.fSize,
                                                                fontWeight: FontWeight.w500
                                                            )
                                                          ),
                                                        ),
                                                        // child: Image.asset(artStylesController.currentArt!.image!,
                                                        //   color: color.withOpacity(0.5),
                                                        //   colorBlendMode: BlendMode.color,
                                                        //   fit: BoxFit.fill,
                                                        // ),
                                                      ),
                                                    ),
                                                  );
                                                })),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 28.v, right: 20.h,left: 20.h,bottom: 16.v),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("lbl_aspect_ratio".tr,
                                                      style: theme.textTheme
                                                          .titleMedium),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 4.v),
                                                      child: Text(
                                                          "lbl_view_all".tr,
                                                          style: CustomTextStyles
                                                              .bodyMediumGray700))
                                                ])),
                                        GetBuilder<HomeController>(
                                          init: HomeController(),
                                          builder: (homeController) =>  SizedBox(
                                            height: 48.v,
                                            child: ListView.builder(
                                              padding: EdgeInsets.only(left: 12.h, right: 12.h),
                                              itemCount: homeController.aspectRatioList.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                AspectRatioModel model =
                                                homeController.aspectRatioList[index];
                                                return Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      homeController.setCurrentSize(model.id);
                                                    },
                                                    child: Listview1ItemWidget(
                                                      model,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
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
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                          child: Text("lbl_font".tr,
                                              style: theme.textTheme.titleMedium),
                                        ),
                                        SizedBox(height: 16.v),
                                        GridView.builder(
                                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                                          primary: false,
                                          shrinkWrap: true,
                                          itemCount: controller.fontFamilyList.length,
                                          gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            mainAxisExtent: 64.v,
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 20.h,
                                            crossAxisSpacing: 16.h),itemBuilder: (context, index) {
                                          FontFamilyModel model = controller.fontFamilyList[index];
                                              return GridpopinstextItemWidget(
                                                  model);
                                            },),
                                        SizedBox(height: 28.v),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                          child: Text("msg_back_ground_color".tr,
                                              style: theme.textTheme.titleMedium),
                                        ),
                                        SizedBox(height: 16.v),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: AppDecoration
                                                .fillGray10002
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder8),
                                            child: GridView.builder(
                                              padding: EdgeInsets.all(16.h),
                                              primary: false,
                                              shrinkWrap: true,
                                              itemCount:
                                                  controller.defaultColors.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      mainAxisExtent: 54.v,
                                                      crossAxisCount: 5,
                                                      mainAxisSpacing: 16.h,
                                                      crossAxisSpacing: 18.h),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .setCurrentColorindex(
                                                            index);
                                                    editController
                                                        .captureAndSaveImage();
                                                    editController
                                                        .captureAndSaveImage();
                                                    // addNewCategoryController
                                                    //     .onChange(color);
                                                  },
                                                  child: index == 0
                                                      ? Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        AssetImage(
                                                                      ImageConstant
                                                                          .imgBgBlankCirculer1,
                                                                    ),
                                                                  ),
                                                                  border: Border.all(
                                                                      color: controller.currentColorIndex ==
                                                                              index
                                                                          ? appTheme
                                                                              .blue
                                                                          : Colors
                                                                              .transparent,
                                                                      width: 2.v),
                                                                  shape: BoxShape
                                                                      .circle),
                                                        )
                                                      : Container(
                                                          height: 54.adaptSize,
                                                          width: 54.adaptSize,
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: controller
                                                                              .currentColorIndex ==
                                                                          index
                                                                      ? appTheme
                                                                          .blue
                                                                      : Colors
                                                                          .transparent,
                                                                  width: 2.v),
                                                              color: controller
                                                                      .defaultColors[
                                                                  index],
                                                              shape: BoxShape
                                                                  .circle)),
                                                );
                                              },
                                            ),
                                          ),
                                        ),


                                        SizedBox(height: 26.v),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                          child: Text("lbl_text_color".tr,
                                              style: theme.textTheme.titleMedium),
                                        ),
                                        SizedBox(height: 16.v),
                                        Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: AppDecoration
                                                .fillGray10002
                                                .copyWith(
                                                borderRadius:
                                                BorderRadiusStyle
                                                    .roundedBorder8),
                                            child: GridView.builder(
                                              padding: EdgeInsets.all(16.h),
                                              primary: false,
                                              shrinkWrap: true,
                                              itemCount: controller
                                                  .defaultTextColors.length,
                                              gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent: 54.v,
                                                  crossAxisCount: 5,
                                                  mainAxisSpacing: 16.h,
                                                  crossAxisSpacing: 18.h),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .setCurrentTextColorindex(
                                                        index);
                                                    // editController
                                                    //     .captureAndSaveImage();
                                                  },
                                                  child: index == 0
                                                      ? Container(
                                                    decoration:
                                                    BoxDecoration(
                                                        image:
                                                        DecorationImage(
                                                          image:
                                                          AssetImage(
                                                            ImageConstant
                                                                .imgTextColorNone,
                                                          ),
                                                        ),
                                                        border: Border.all(
                                                            color: controller.currentTextColorIndex ==
                                                                index
                                                                ? appTheme
                                                                .blue
                                                                : Colors
                                                                .transparent,
                                                            width: 2.v),
                                                        shape: BoxShape
                                                            .circle),
                                                  )
                                                      : Container(
                                                      height: 54.adaptSize,
                                                      width: 54.adaptSize,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: controller
                                                                  .currentTextColorIndex ==
                                                                  index
                                                                  ? appTheme
                                                                  .blue
                                                                  : Colors
                                                                  .transparent,
                                                              width: 2.v),
                                                          color: controller
                                                              .defaultTextColors[
                                                          index],
                                                          shape: BoxShape
                                                              .circle)),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ]))))
                    ])),
              ),
            ),
            bottomNavigationBar: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 24.v,top: 24.v),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomOutlinedButton(
                          width: 173.h, text: "lbl_generate".tr),
                      CustomElevatedButton(
                        onTap: (){
                          getDownloadDialogue(context,(){});
                        },
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
