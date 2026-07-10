import 'dart:io';

import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../recolour_image_screen/controller/recolour_image_controller.dart';
import 'controller/edit_seven_controller.dart';



class EditSevenScreen extends StatefulWidget {
  const EditSevenScreen({super.key});

  @override
  State<EditSevenScreen> createState() => _EditSevenScreenState();
}

class _EditSevenScreenState extends State<EditSevenScreen> {
  EditSevenController controller = Get.put(EditSevenController());
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return WillPopScope(
        onWillPop: () async{
          Get.back();
          return true;
        },
        child: Scaffold(
            body: ColorfulSafeArea(
              color: appTheme.whiteA700,
              child: GetBuilder<RecolourImageController>(
                init: RecolourImageController(),
                builder:(recolourImageController) =>  SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      getCommonAppBar("lbl_edit".tr,actionWidget: AppbarSubtitle(
                          text: "lbl_finalize".tr,
                          onTap: () {
                            controller.captureAndSaveImage();
                            onTapFinalize();
                          })),
                      SizedBox(height: 24.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 0.h, right: 0.h, bottom: 5.v),
                                  child: Column(children: [
                                    recolourImageController.images != null?
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                                      child: RepaintBoundary(
                                        key:controller.globalKey,
                                        child: ValueListenableBuilder(
                                          valueListenable: _filterColor,
                                          builder: (context, color, child) {
                                            return Container(
                                              height: 374.v,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(8.h),
                                                  image: DecorationImage(
                                                      image: FileImage(File(recolourImageController.images!.path)),
                                                      fit: BoxFit.fill,
                                                      colorFilter: ColorFilter.mode(
                                                          color.withOpacity(0.5),
                                                          BlendMode.color))),

                                            );


                                          },
                                        ),
                                      ),
                                    ):CircularProgressIndicator(),
                                    SizedBox(height: 24.v),
                                    FilterSelector(
                                      isGrid: true,
                                      onFilterChanged: onFilterChanged,
                                      filters: _filters, image: FileImage(File(recolourImageController.images!.path)), imagesize: 125,
                                    ),
                                    // GridView.builder(
                                    //   primary: false,
                                    //   shrinkWrap: true,
                                    //   itemCount: _filters.length,
                                    //   gridDelegate:   SliverGridDelegateWithFixedCrossAxisCount(
                                    //       mainAxisExtent: 125.v,
                                    //       crossAxisCount: 4,
                                    //       mainAxisSpacing: 20.h,
                                    //       crossAxisSpacing: 20.h), itemBuilder: (context, index) {
                                    //   return GestureDetector(
                                    //     onTap:(){
                                    //       onFilterChanged(Color(_filters[index].value));
                                    //     },
                                    //     child: Container(
                                    //       color: Colors.red,
                                    //     ),
                                    //   );
                                    // },)


                                    // Obx(() => GridView.builder(
                                    //     shrinkWrap: true,
                                    //     gridDelegate:
                                    //         SliverGridDelegateWithFixedCrossAxisCount(
                                    //             mainAxisExtent: 125.v,
                                    //             crossAxisCount: 4,
                                    //             mainAxisSpacing: 21.h,
                                    //             crossAxisSpacing: 21.h),
                                    //     physics: NeverScrollableScrollPhysics(),
                                    //     itemCount: controller
                                    //         .editSevenModelObj
                                    //         .value
                                    //         .gridusertextItemList
                                    //         .value
                                    //         .length,
                                    //     itemBuilder: (context, index) {
                                    //       GridusertextItemModel model = controller
                                    //           .editSevenModelObj
                                    //           .value
                                    //           .gridusertextItemList
                                    //           .value[index];
                                    //       return GridusertextItemWidget(model);
                                    //     }))
                                  ]))))
                    ])),
              ),
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
                              width: 173.h, text: "lbl_generate".tr),
                          CustomElevatedButton(
                            onTap: (){
                              controller.captureAndSaveImage();
                              getDownloadDialogue(context, (){});
                            },
                              width: 177.h, text: "lbl_download".tr)
                        ])))));
  }


  onTapEdit() {
    Get.toNamed(
      AppRoutes.recolourImageOneScreen,
    );
  }

  onTapFinalize() {
    Get.toNamed(
      AppRoutes.finalizeThreeScreen,
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

  void onFilterChanged(Color value) {
    _filterColor.value = value;
  }
}




