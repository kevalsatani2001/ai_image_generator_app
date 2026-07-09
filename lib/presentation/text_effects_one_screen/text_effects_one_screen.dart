import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_button_1.dart';
import 'package:ai_image_generator/widgets/app_bar/custom_app_bar.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../text_effects_one_screen/widgets/grida_one_item_widget.dart';
import 'controller/text_effects_one_controller.dart';
import 'models/grida_one_item_model.dart';



class TextEffectsOneScreen extends StatefulWidget {
  const TextEffectsOneScreen({super.key});

  @override
  State<TextEffectsOneScreen> createState() => _TextEffectsOneScreenState();
}

class _TextEffectsOneScreenState extends State<TextEffectsOneScreen> {
 TextEffectsOneController textEffectsOneController = Get.put(TextEffectsOneController());
 @override
 Widget build(BuildContext context) {
  mediaQueryData = MediaQuery.of(context);
  return WillPopScope(
      onWillPop: ()async{
       Get.back();
       return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GetBuilder<TextEffectsOneController>(
            init: TextEffectsOneController(),
            builder:(controller) =>  Stack(
              children: [
                    SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                     getCommonAppBar("Text effects"),
                     SizedBox(height: 8.v),
                     Expanded(
                         child: Column(children: [
                          CustomSearchView(
                              margin: EdgeInsets.symmetric(horizontal: 20.h),
                              controller: controller.searchController,
                              hintText: "lbl_search".tr,
                              prefix: Container(
                                  margin: EdgeInsets.fromLTRB(16.h, 12.v, 12.h, 12.v),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgSearchBlack900)),
                              prefixConstraints: BoxConstraints(maxHeight: 48.v),
                              suffix: Padding(
                                  padding: EdgeInsets.only(right: 15.h),
                                  child: IconButton(
                                      onPressed: () {
                                       controller.searchController.clear();
                                      },
                                      icon: Icon(Icons.clear,
                                          color: Colors.grey.shade600)))),
                           Expanded(
                             child: GridView.builder(
                               padding: EdgeInsets.only(left: 20.h,right: 20.h,top: 16.v,bottom: 104.v),
                                 shrinkWrap: true,
                                 primary: false,
                                 gridDelegate:
                                 SliverGridDelegateWithFixedCrossAxisCount(
                                     mainAxisExtent: 194.v,
                                     crossAxisCount: 2,
                                     mainAxisSpacing: 20.h,
                                     crossAxisSpacing: 20.h),
                                 itemCount: controller.textEffectList.length,
                                 itemBuilder: (context, index) {
                                   GridaOneItemModel model = controller
                                       .textEffectList[index];
                                   return GridaOneItemWidget(model);
                                 }),
                           ),
                          SizedBox(height: 20.v),

                         ]))
                    ])),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: appTheme.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.v),
                          child: CustomElevatedButton(
                              width: double.infinity,
                              text: "lbl_create".tr,
                              onTap: controller.curretTextEffextID == 0 || controller.curretTextEffextID == null?(){
                                getCustomToast("Please select any Text effect");
                              }:() {
                                onTapCreate();
                              },
                              alignment: Alignment.bottomCenter),
                        ),
                      ],
                    ),
                  ),
                )
                  ],
            ),
          )));
 }

 onTapCreate() {
  Get.toNamed(
   AppRoutes.textEffectsScreen,
  );
 }
}






