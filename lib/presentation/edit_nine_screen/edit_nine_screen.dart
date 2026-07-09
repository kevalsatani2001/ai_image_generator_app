import 'package:ai_image_generator/core/app_export.dart';
import 'package:ai_image_generator/widgets/app_bar/appbar_subtitle.dart';
import 'package:ai_image_generator/widgets/custom_elevated_button.dart';
import 'package:ai_image_generator/widgets/custom_outlined_button.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import '../home_screen/controller/home_controller.dart';
import '../home_screen/models/aspect_ratio_model.dart';
import '../home_screen/widgets/listview1_item_widget.dart';
import '../logo_generator_screen/controller/logo_generator_controller.dart';
import 'controller/edit_nine_controller.dart';



class EditNineScreen extends StatefulWidget {
  const EditNineScreen({super.key});

  @override
  State<EditNineScreen> createState() => _EditNineScreenState();
}

class _EditNineScreenState extends State<EditNineScreen> {
 EditNineController controller = Get.put(EditNineController());
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
          body: ColorfulSafeArea(
           color: appTheme.whiteA700,
            child: GetBuilder<LogoGeneratorController>(
             init: LogoGeneratorController(),
             builder:(logoGeneratorController) =>  Stack(
               children: [
                     SizedBox(
                     width: double.maxFinite,
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          getCommonAppBar("lbl_edit".tr,actionWidget:AppbarSubtitle(
                              text: "lbl_finalize".tr,
                              onTap: () {
                                controller.captureAndSaveImage();
                               onTapFinalize();
                              }) ),
                      SizedBox(height: 24.v),
                      Expanded(
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: 110.v),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                 Padding(
                                   padding:  EdgeInsets.symmetric(horizontal: 20.h),
                                   child: RepaintBoundary(
                                     key:controller.globalKey,
                                     child: SizedBox(
                                         height: 374.adaptSize,
                                         width:double.infinity,
                                         child: Stack(alignment: Alignment.center, children: [
                                          Container(
                                           height: 374.v,
                                           width: double.infinity,
                                           decoration: logoGeneratorController.currentColorIndex == 0?BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.h),
                                            image: DecorationImage(image: AssetImage(ImageConstant.imgRectangle76412,),fit: BoxFit.fill)

                                           ):BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.h),
                                            color: logoGeneratorController.defaultColors[logoGeneratorController.currentColorIndex]
                                           ),
                                          ),



                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: 74.h,vertical: 51.v),
                                            child: CustomImageView(
                                                svgPath: ImageConstant.imgBirdLogo,
                                                height: double.infinity,
                                                width: double.infinity,
                                                alignment: Alignment.center),
                                          )
                                         ])),
                                   ),
                                 ),
                                 Padding(
                                     padding:
                                     EdgeInsets.only(left: 19.h, top: 16.v, right: 19.h),
                                     child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                          SizedBox(
                                              height: 100.v,
                                              width: 78.h,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                   CustomImageView(
                                                       imagePath:
                                                       ImageConstant.imgRectangle76412,
                                                       height: 100.v,
                                                       width: 78.h,
                                                       radius: BorderRadius.circular(8.h),
                                                       alignment: Alignment.center),
                                                   CustomImageView(
                                                       svgPath: ImageConstant.imgTwitter,
                                                       height: 56.v,
                                                       width: 47.h,
                                                       alignment: Alignment.center)
                                                  ])),
                                          SizedBox(
                                              height: 100.v,
                                              width: 78.h,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                   CustomImageView(
                                                       imagePath:
                                                       ImageConstant.imgRectangle76412,
                                                       height: 100.v,
                                                       width: 78.h,
                                                       radius: BorderRadius.circular(8.h),
                                                       alignment: Alignment.center),
                                                   CustomImageView(
                                                       svgPath: ImageConstant
                                                           .imgTwitterLightGreen500,
                                                       height: 56.v,
                                                       width: 47.h,
                                                       alignment: Alignment.center)
                                                  ])),
                                          SizedBox(
                                              height: 100.v,
                                              width: 78.h,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                   CustomImageView(
                                                       imagePath:
                                                       ImageConstant.imgRectangle76412,
                                                       height: 100.v,
                                                       width: 78.h,
                                                       radius: BorderRadius.circular(8.h),
                                                       alignment: Alignment.center),
                                                   CustomImageView(
                                                       svgPath:
                                                       ImageConstant.imgTwitterPink700,
                                                       height: 56.v,
                                                       width: 47.h,
                                                       alignment: Alignment.center)
                                                  ])),
                                          SizedBox(
                                              height: 100.v,
                                              width: 78.h,
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                   CustomImageView(
                                                       imagePath:
                                                       ImageConstant.imgRectangle76412,
                                                       height: 100.v,
                                                       width: 78.h,
                                                       radius: BorderRadius.circular(8.h),
                                                       alignment: Alignment.center),
                                                   CustomImageView(
                                                       svgPath:
                                                       ImageConstant.imgTwitterTeal300,
                                                       height: 56.v,
                                                       width: 47.h,
                                                       alignment: Alignment.center)
                                                  ]))
                                         ])),
                                 Padding(
                                     padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                     child: Text("lbl_aspect_ratio".tr,
                                         style: theme.textTheme.titleMedium)),
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
                                 Padding(
                                     padding: EdgeInsets.only(left: 20.h, top: 28.v,bottom: 16.v),
                                     child: Text("msg_back_ground_color".tr,
                                         style: theme.textTheme.titleMedium)),
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
                                    logoGeneratorController.defaultColors.length,
                                    gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 54.v,
                                        crossAxisCount: 5,
                                        mainAxisSpacing: 16.h,
                                        crossAxisSpacing: 18.h),
                                    itemBuilder: (context, index) {
                                     return GestureDetector(
                                      onTap: () {
                                       logoGeneratorController
                                           .setCurrentColorindex(
                                           index);
                                       // editController
                                       //     .captureAndSaveImage();
                                       // editController
                                       //     .captureAndSaveImage();
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
                                                 .imgLogoGeberaterBlankBackground,
                                            ),
                                           ),
                                           border: Border.all(
                                               color: logoGeneratorController.currentColorIndex ==
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
                                                  color: logoGeneratorController
                                                      .currentColorIndex ==
                                                      index
                                                      ? appTheme
                                                      .blue
                                                      : Colors
                                                      .transparent,
                                                  width: 2.v),
                                              color: logoGeneratorController
                                                  .defaultColors[
                                              index],
                                              shape: BoxShape
                                                  .circle)),
                                     );
                                    },
                                   ),
                                  ),
                                 ),

                                ])),
                          ))
                     ])),
                 Align(
                   alignment: Alignment.bottomCenter,
                   child: Container(
                       width: double.maxFinite,
                       color: appTheme.whiteA700,
                       padding: EdgeInsets.symmetric(vertical: 24.v),
                       child: Row(
                           mainAxisAlignment:
                           MainAxisAlignment.spaceEvenly,
                           children: [
                             CustomOutlinedButton(
                                 width: 173.h,
                                 text: "lbl_generate".tr),
                             CustomElevatedButton(
                               onTap: (){
                                 getDownloadDialogue(context, (){});
                               },
                                 width: 177.h,
                                 text: "lbl_download".tr)
                           ])),
                 )
                   ],
             ),
            ),
          )));
 }

 onTapEdit() {
  Get.toNamed(
   AppRoutes.logoGeneratorScreen,
  );
 }

 onTapFinalize() {
  Get.toNamed(
   AppRoutes.sketchToImagesTwoScreen,
  );
 }
}



