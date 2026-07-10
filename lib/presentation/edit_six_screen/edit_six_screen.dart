import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../edit_artwork_screen/edit_artwork_screen.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import 'controller/edit_six_controller.dart';




class EditSixScreen extends StatefulWidget {
  const EditSixScreen({super.key});

  @override
  State<EditSixScreen> createState() => _EditSixScreenState();
}

class _EditSixScreenState extends State<EditSixScreen> {
 EditSixController controller = Get.put(EditSixController());
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
            child: GetBuilder<EditSixController>(
              init: EditSixController(),
              builder:(editSixController) =>  SizedBox(
                  width: double.maxFinite,
                  child: Column(children: [

                   getCommonAppBar("lbl_edit".tr,actionWidget: AppbarSubtitle(
                       text: "lbl_finalize".tr,
                       onTap: () {
                         editSixController.captureAndSaveImage();
                        onTapFinalize();
                       })),

                   Container(
                       padding: EdgeInsets.symmetric(vertical: 24.v),
                       child: Column(children: [

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: RepaintBoundary(
                           key:controller.globalKey,
                           child:ValueListenableBuilder(
                            valueListenable: _filterColor,
                            builder: (context, color, child) {
                             return Container(
                              height: 374.v,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(8.h),
                                  image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgRectangle76410),
                                      fit: BoxFit.fill,
                                      colorFilter: ColorFilter.mode(
                                          color.withOpacity(0.5),
                                          BlendMode.color))),

                             );


                            },
                           ),
                          ),
                        ),

                       SizedBox(height: 24.v,),
                         FilterSelector(
                           onFilterChanged: _onFilterChanged,
                           filters: _filters, image: AssetImage(ImageConstant.imgRectangle76410), imagesize: 100,
                         ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                child: Text("lbl_aspect_ratio".tr,
                                    style: theme.textTheme.titleMedium))),
                        GetBuilder<HomeController>(
                         init: HomeController(),
                         builder:(controller) =>  SizedBox(
                          height: 48.v,
                          child: ListView.builder(
                           padding: EdgeInsets.only(left: 12.h, right: 12.h),
                           itemCount: controller.aspectRatioList.length,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index) {
                            AspectRatioModel model =
                            controller.aspectRatioList[index];
                            return Padding(
                             padding: EdgeInsets.symmetric(horizontal: 8.h),
                             child: GestureDetector(
                              onTap: () {
                               controller.setCurrentSize(model.id);
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
                       ]))
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
                    onTap: (){
                     getDownloadDialogue(context, (){});
                    },
                       width: 177.h, text: "lbl_download".tr)
                  ]))));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.sketchToImagesFourScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.finalizeTenScreen,
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
}






